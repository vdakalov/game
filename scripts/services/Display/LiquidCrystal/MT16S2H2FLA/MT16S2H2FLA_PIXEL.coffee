service "MT16S2H2FLA_PIXEL:el,BasePixel", (el, BasePixel) ->
  class MT16S2H2FLA_PIXEL
    MT16S2H2FLA_PIXEL:: = new BasePixel

    tagName: "div"
    styles:
      common:
        width: "4px"
        height: "4px"
        opacity: ".1"
        background: "#444444"
      active:
        opacity: ".9"

    constructor: (@x, @y, @size) ->
      @styles.common.width = "#{@size}px"
      @styles.common.height = "#{@size}px"
      do @make