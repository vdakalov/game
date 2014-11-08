service "LiquidCrystal:DefaultPixel,BasePixel,utils,el", (DefaultPixel, BasePixel, utils, el) ->

  class LiquidCrystal

    LiquidCrystal:: = new Array

    @pixelSize: 1

    init: (pixel = DefaultPixel) ->
      if utils.instanceOf pixel, BasePixel
        utils.repeat @width * @height, @, (index) ->
          coord = utils.index2coord(@width, index)
          @push new pixel coord[0], coord[1]

    mount: (parent) ->
      el.styles parent,
        width: "#{@pixelSize*@width}px"
        height: "#{@pixelSize*@height}px"
      fragment = document.createDocumentFragment()

      utils.each @, (pixel) ->
        if utils.instanceOf pixel, BasePixel
          fragment.appendChild pixel.el
      parent.appendChild fragment

    clear: ->
      utils.each @, (pixel) -> pixel.active false

    setPixel: (x, y) ->
      index = utils.coord2index(@width, x, y)
      if index of @
        @[index].active true