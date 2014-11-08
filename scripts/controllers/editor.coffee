return
controller "editor:el,Display,HexSymbol,MT16S2H2FLA,CloseRenderPreprocessor", (el, Display, HexSymbol, MT16S2H2FLA, CloseRenderPreprocessor) ->
  display = new Display(el.get("#editor"), 80, 16)
  display.setLiquidCrystal MT16S2H2FLA
  display.setPreprocessor CloseRenderPreprocessor

  display.printSymbol new HexSymbol("B", 5, "f463e8c63e")