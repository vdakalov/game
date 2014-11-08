service "BasePixel:el", (el) ->
  class BasePixel
    make: ->
      @el = el.make @tagName
      el.styles @el,
        width: "#{@size}px"
        height: "#{@size}px"
        opacity: ".1"
        margin: "1px 0 0 1px"
        background: "#444444"
        float: "left"

    active: (turn) ->
      el.style @el, "opacity", if turn then ".9" else ".1"