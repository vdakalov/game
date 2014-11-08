service "Display:LiquidCrystal,RenderPreprocessor,Symbol,utils",
  (LiquidCrystal, RenderPreprocessor, Symbol, utils) ->

    class Display

      liquidCrystal = null
      preprocesstor = null

      setPixel = (x, y) ->
        if utils.instanceOf preprocesstor, RenderPreprocessor
          [x, y] = preprocesstor.transform x, y

        if utils.instanceOf liquidCrystal, LiquidCrystal
          liquidCrystal.setPixel x, y

      constructor: (@canvas, @width, @height) ->

      setPreprocessor: (preprocessor) ->
        if utils.instanceOf preprocessor, RenderPreprocessor
          preprocesstor = new preprocessor @width, @height

      setLiquidCrystal: (lc) ->
        if utils.instanceOf lc, LiquidCrystal
          liquidCrystal = new lc @width, @height
          liquidCrystal.mount @canvas

      clear: ->
        liquidCrystal.clear()

      cursor: do ->
        position = [0, 0]
        (x, y) ->
          [x, y] = [ (if x >= 0 then x else position[0]), (if y >=0 then y else position[1]) ]

      printSymbol: (symbol) ->
        if utils.instanceOf symbol, Symbol
          console.log symbol.mask
          utils.each symbol.mask, @, (bit, key, index) ->
            if bit is 1
              setPixel.apply(@, utils.index2coord(symbol.size, index))
        undefined
