service "Display:LiquidCrystal,RenderPreprocessor,Symbol,utils",
  (LiquidCrystal, RenderPreprocessor, Symbol, utils) ->

    class Display

      liquidCrystal = null
      preprocesstor = null

      setPixel = (x, y) ->
        if preprocesstor instanceof RenderPreprocessor
          [x, y] = preprocesstor.transform x, y

        if liquidCrystal instanceof LiquidCrystal
          liquidCrystal.setPixel x, y

      constructor: (@canvas, @width, @height) ->

      setPreprocessor: (preprocessor) ->
        if (preprocessor::) instanceof RenderPreprocessor
          preprocesstor = new preprocessor @width, @height

      setLiquidCrystal: (lc) ->
        if (lc::) instanceof LiquidCrystal
          liquidCrystal = new LiquidCrystal @width, @height
          liquidCrystal.mount @canvas

      clear: ->
        liquidCrystal.clear()

      cursor: do ->
        position = [0, 0]
        (x, y) ->
          [x, y] = [ (if x >= 0 then x else position[0]), (if y >=0 then y else position[1]) ]

      printSymbol: (symbol) ->
        if symbol instanceof Symbol
          each symbol.mask, @, (bit, key, index) ->
            if bit is 1
              setPixel.appy(@, utils.index2coord(@width, index))
        undefined
