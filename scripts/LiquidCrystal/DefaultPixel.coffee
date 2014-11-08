di "DefaultPixel", ["el", "BasePixel"], (el, BasePixel) ->
  class DefaultPixel
    DefaultPixel:: = new BasePixel
    tagName: "div"
    className: "active"
    constructor: (@x, @y) ->
      do @make