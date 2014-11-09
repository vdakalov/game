service "LiquidCrystal:DefaultPixel,BasePixel,utils,el", (DefaultPixel, BasePixel, utils, el) ->

  class LiquidCrystal

    LiquidCrystal:: = new Array

    @name = "Unnamed"
    @address = "javascript:void(0);"
    @borderColor = "#000000"

    @pixelSize = 1

    build: ->
      utils.repeat @width * @height, @, (index) ->
        coord = utils.index2coord(@width, index)
        @push new @pixel coord[0], coord[1], @pixelSize

    mount: (parent) ->

      # styles for wrapper
      el.styles parent,
        width: "#{((@pixelSize+1)*@width)+1}px"
        height: "#{((@pixelSize+1)*@height)+21}px"
        background: @backlight
        borderLeft: "4px solid #{@borderColor}"
        borderRight: "4px solid #{@borderColor}"
        borderBottom: "4px solid #{@borderColor}"

      # make vendor panel
      vendor = el.make("a", href: @address, target: "_blank", @name, el.make("div", null, null, parent)).parentNode
      el.styles vendor,
        height: "20px"
        background: "#{@borderColor}"
      el.styles vendor.children.item(0),
        color: "#FFFFFF"
        fontSize: "12px"
        fontFamily: "sans-serif"
        textDecoration: "none"


      # fragment for pixels
      fragment = document.createDocumentFragment()

      # make pixels
      utils.each @, (pixel) ->
        if utils.instanceOf pixel, BasePixel
          fragment.appendChild pixel.el

      parent.appendChild fragment

    clear: ->
      utils.each @, (pixel) -> pixel.active false

    round: (num) ->
      Math.round num

    setPixel: (x, y) ->
      @setIndex utils.coord2index(@width, @round(x), @round(y))

    setIndex: (index) ->
      if index of @
        @[index].active true