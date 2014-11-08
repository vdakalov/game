service "CharacterGenerator:LiquidCrystal,Symbol,utils", (LiquidCrystal,Symbol, utils) ->
  class CharacterGenerator

    liquidCrystal = null

    constructor: (lc) ->
      liquidCrystal = lc

    printSymbol: (symbol) ->
      utils.each symbol.mask, @, (bit, key, index) ->
        if bit is 1
          liquidCrystal.setPixel.apply(liquidCrystal, utils.index2coord(symbol.size, index))
      undefined

