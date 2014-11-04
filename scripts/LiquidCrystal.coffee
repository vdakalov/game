class Pixel
  tagName = "div"
  className = "active"

  constructor: (@x, @y) ->
    @el = el.make tagName

  active: (turn) ->
    el.class @el, className, turn
    undefined

  isActive: ->
    el.class @el, className

class LiquidCrystal

  # pixel collect
  pixels = {}

  # buffer for active pixels
  active_pixels = {}

  getKey = (x,y) -> "x#{x}y#{y}"

  constructor: (@width, @height) ->

    # build pixel
    repeat @width * @height, @, (index) ->
      x = index % @width
      y = index / @width >> 0
      key = getKey x, y
      pixels[key] = new Pixel x, y

  mount: (parent) ->
    fragment = document.createDocumentFragment()
    each pixels, (pixel) ->
      fragment.appendChild pixel.el
    parent.appendChild fragment

  clear: ->
    each active_pixels, (pixel) -> pixel.active false
    active_pixels = {}
    true

  setPixel: (x, y) ->
    key = getKey x, y
    if key of pixels and not pixels[key].isActive()
      pixels[key].active(true)
      if pixels[key].isActive()
        active_pixels[key] = pixels[key]
        return true
    false


window.LiquidCrystal = LiquidCrystal