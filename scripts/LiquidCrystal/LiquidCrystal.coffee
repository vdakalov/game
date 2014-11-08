di "LiquidCrystal", ["DefaultPixel", "utils", "el"], (DefaultPixel, utils, el) ->

  coord2index = (width, x, y) ->
    ((y - 1) * width) + x

  index2coord = (width, index) ->
    [width % index, (width / index >> 0) + 1]

  class LiquidCrystal

    LiquidCrystal:: = new Array

    defaultOptions =
      pixelSize: 5

    constructor: (@width, @height, @options = defaultOptions) ->

      # build pixel
      utils.repeat @width * @height, @, (index) ->
        coord = index2coord(@width, index)
        @push new DefaultPixel coord[0], coord[1]

    mount: (parent) ->
      el.styles parent,
        width: "#{@options.pixelSize*@width}px"
        height: "#{@options.pixelSize*@height}px"
      fragment = document.createDocumentFragment()
      utils.each @, (pixel) ->
        if pixel instanceof DefaultPixel
          fragment.appendChild pixel.el
      parent.appendChild fragment

    clear: ->
      utils.each @, (pixel) -> pixel.active false

    setPixel: (x, y) ->
      index = coord2index(@width, x, y)
      if index of @
        @[index].active true