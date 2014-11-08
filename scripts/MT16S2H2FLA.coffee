service "MT16S2H2FLA:LiquidCrystal", (LiquidCrystal) ->
  class MT16S2H2FLA
    MT16S2H2FLA:: = new LiquidCrystal

    pixelSize: 5

    constructor: (@width, @height) ->

      do @init
