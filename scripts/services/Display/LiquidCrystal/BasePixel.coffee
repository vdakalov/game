service "BasePixel:el", (el) ->
  class BasePixel
    baseStyles =
      margin: "1px 0 0 1px"
      "float": "left"
    make: ->
      @el = el.make @tagName
      el.styles @el, @styles.common
      el.styles @el, baseStyles

    active: (turn) ->
      el.styles @el,
        if turn is true
          @styles.active
        else
          @styles.common
      el.styles @el, baseStyles