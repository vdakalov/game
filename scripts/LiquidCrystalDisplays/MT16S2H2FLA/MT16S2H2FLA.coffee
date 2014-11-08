service "MT16S2H2FLA:LiquidCrystal,MT16S2H2FLA_PIXEL", (LiquidCrystal,MT16S2H2FLA_PIXEL) ->
  class MT16S2H2FLA

    MT16S2H2FLA:: = new LiquidCrystal

    width: 80
    height: 16

    pixelSize: 8
    backlight: "#FED04B"

    pixel: MT16S2H2FLA_PIXEL

    constructor: (canvas) ->
      do @build
      @mount canvas