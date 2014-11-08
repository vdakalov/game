di "LiquidCrystal", ["DefaultPixel", "BasePixel", "utils", "el"], (DefaultPixel, BasePixel, utils, el) ->

  coord2index = (width, x, y) ->
    ((y - 1) * width) + x - 1

  index2coord = (width, index) ->
    [width % index, (width / index >> 0) + 1]

  class LiquidCrystal

    LiquidCrystal:: = new Array

    @pixelSize: 1

    init: (pixel = DefaultPixel) ->
      if (pixel::) instanceof BasePixel
        utils.repeat @width * @height, @, (index) ->
          coord = index2coord(@width, index)
          @push new pixel coord[0], coord[1]

    mount: (parent) ->
      el.styles parent,
        width: "#{@pixelSize*@width}px"
        height: "#{@pixelSize*@height}px"
      fragment = document.createDocumentFragment()
      utils.each @, (pixel) ->
        if pixel instanceof BasePixel
          fragment.appendChild pixel.el
      parent.appendChild fragment

    clear: ->
      utils.each @, (pixel) -> pixel.active false

    setPixel: (x, y) ->
      index = coord2index(@width, x, y)
      if index of @
        @[index].active true