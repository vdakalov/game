class Pixel
  tagName = "div"
  className = "active"

  constructor: (@x, @y, parent) ->
    @el = el.make tagName, null, null, parent

  active: (turn) ->
    el.class @el, className, turn
    undefined

  isActive: ->
    el.class @el, className

class Display

  # pixel size
  pixel_size = width: 5, height: 5

  # pixel collect
  pixels = {}

  # buffer for active pixels
  active_pixels = {}

  getKey = (x,y) -> "x#{x}y#{y}"

  constructor: (@canvas, @width, @height) ->

    # build pixel
    repeat @width * @height, @, (index) ->
      x = index % @width
      y = index / @width >> 0
      key = getKey x, y
      pixels[key] = new Pixel x, y, @canvas

    # update canvas size
    el.styles @canvas, width: "#{@width*pixel_size.width}px", height: "#{@height*pixel_size.height}px"

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


window.Display = Display