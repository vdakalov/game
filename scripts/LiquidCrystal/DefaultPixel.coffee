service "DefaultPixel:el,BasePixel", (el, BasePixel) ->
  class DefaultPixel
    DefaultPixel:: = new BasePixel
    tagName: "div"
    constructor: (@x, @y, @size) ->
      do @make