service "MT16S2H2FLA:LiquidCrystal,MT16S2H2FLA_PIXEL", (LiquidCrystal,MT16S2H2FLA_PIXEL) ->
  class MT16S2H2FLA

    MT16S2H2FLA:: = new LiquidCrystal

    name: "МЭЛТ MT-16S2H-2FLA"
    address: "http://www.melt.com.ru/index.php?page=shop.product_details&product_id=6506&Itemid=6"
    borderColor: "#555555"

    width: 80
    height: 16

    pixelSize: 8
    backlight: "#FED04B"

    pixel: MT16S2H2FLA_PIXEL

    constructor: (canvas) ->
      do @build
      @mount canvas