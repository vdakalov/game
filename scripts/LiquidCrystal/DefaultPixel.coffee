di "DefaultPixel", ["el", "BasePixel"], (el, BasePixel) ->
  class DefaultPixel
    DefaultPixel:: = new BasePixel
    tagName: "div"
    activeName: "active"
    constructor: (@x, @y) ->
      do @make