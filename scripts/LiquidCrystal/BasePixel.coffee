di "BasePixel", ["el"], (el) ->
  class BasePixel
    make: ->
      @el = el.make @tagName

    active: (turn) ->
      el.class @el, @className, turn

    isActive: ->
      el.class @el, @className