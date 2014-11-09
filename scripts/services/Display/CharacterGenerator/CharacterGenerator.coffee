service "CharacterGenerator:LiquidCrystal,Symbols,utils", (LiquidCrystal,Symbols,utils) ->
  class CharacterGenerator

    @CONTROL_SYMBOL_RESET = "resetCursor"
    @CONTROL_SYMBOL_NEWLINE = "newLine"
    @CONTROL_SYMBOL_INCREMENT = "increment"

    liquidCrystal = null

    lines = null
    letters = null

    cursor = [0, 0]

    systemMethods =
      resetCursor: ->
        cursor = [0, 0]
      newLine: ->
        cursor[0] = 0
        cursor[1] = (cursor[1] + (liquidCrystal.height / lines)) % liquidCrystal.height
      increment: ->
        if cursor[0] >= (letters - 1) * (liquidCrystal.width / letters)
          cursor[0] = 0
          do systemMethods.newLine
        else
          cursor[0] = cursor[0] + (liquidCrystal.width / letters)

    constructor: (lc, _letters, _lines) ->
      liquidCrystal = lc
      lines = _lines
      letters = _letters

    printSymbol: (symbol) ->

      switch symbol.type

        when "control"
          do systemMethods[symbol.command]

        else
          utils.each symbol.mask, @, (bit, key, index) ->
            if bit is 1
              coord = utils.index2coord(symbol.size, index)
              x = cursor[0] + coord[0]
              y = cursor[1] + coord[1]
              liquidCrystal.setPixel x, y
          systemMethods.increment()

      undefined

