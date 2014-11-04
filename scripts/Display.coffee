class Display

  # pixel size
  pixel_size = width: 5, height: 5
  display_size = width: null, height: null

  # current cursor position
  cursorPosition = x: 0, y: 0

  # registered symbols
  symbols = {}

  constructor: (canvas, width, height) ->

    # remember sizes
    display_size = width: width, height: height

    # create build LiquidCrystal
    @liquidCrystal = new LiquidCrystal width, height
    @liquidCrystal.mount canvas

    # update canvas size
    el.styles canvas, width: "#{(width*pixel_size.width)+1}px", height: "#{(height*pixel_size.height)+1}px"

  setCursor: (x, y) ->
    if x >= 0 and x <= display_size.width
      cursorPosition.x = x
    if y >= 0 and y <= display_size.height
      cursorPosition.y = y

  printSymbol: (name) ->
    if name of symbols
      symbol = symbols[name]
      each symbol.map, @, (bit, key, index) ->
        if bit is 1
          @liquidCrystal.setPixel(cursorPosition.x + (index % symbol.size), cursorPosition.y + (index / symbol.size >> 0))
    undefined

  addSymbol: (name, size, mask) ->
    map = parseInt(mask, 16).toString(2)
    map = new Array(41).join(0).replace(new RegExp("\\d{0,#{map.length}}$"), map).split(/\0?/)
    map = collect map, (item) -> +item
    symbols[name] = mask: mask, size: size, map: map

  removeSymbol: (name) ->
    delete symbols[name]

window.Display = Display
