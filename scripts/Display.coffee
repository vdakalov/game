class Symbol
  constructor: (@name, @size, hexMask) ->
    mask = parseInt(hexMask, 16).toString(2)
    mask = new Array(41).join(0).replace(new RegExp("\\d{0,#{mask.length}}$"), mask).split(/\0?/)
    mask = collect mask, (item) -> +item
    @mask = mask

class Display

  # pixel size
  pixel_size = width: 5, height: 5
  display_size = width: null, height: null

  # current cursor position
  cursorPosition = x: 0, y: 0

  modes =
    byDefault: "clipped"

    clipped: (symbol, index) ->
      x: cursorPosition.x + (index % symbol.size)
      y: cursorPosition.y + (index / symbol.size >> 0)

    mirror: (symbol, index) ->
      x: (cursorPosition.x + (index % symbol.size)) % display_size.width
      y: (cursorPosition.y + (index / symbol.size >> 0)) % display_size.height

  constructor: (canvas, width, height, @mode = modes.byDefault) ->

    # remember sizes
    display_size = width: width, height: height

    # create build LiquidCrystal
    @liquidCrystal = new LiquidCrystal width, height
    @liquidCrystal.mount canvas

    # update canvas size
    el.styles canvas, width: "#{(width*pixel_size.width)+1}px", height: "#{(height*pixel_size.height)+1}px"

  clear: ->
    @liquidCrystal.clear()

  setCursor: (x, y) ->
    cursorPosition.x = x
    cursorPosition.y = y

  getCursor: ->
    cursorPosition

  printSymbol: (symbol) ->
    if symbol instanceof Symbol
      each symbol.mask, @, (bit, key, index) ->
        if bit is 1
          pos = modes[@mode] symbol, index
          @liquidCrystal.setPixel(pos.x, pos.y)
    undefined

window.Symbol = Symbol
window.Display = Display
