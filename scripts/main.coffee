
controller "main:el,HexSymbol,Display,MT16S2H2FLA,CutRenderPreprocessor",
(el,HexSymbol,Display,MT16S2H2FLA,CutRenderPreprocessor) ->

  symbols =
    A: new HexSymbol "A", 5, "22a318fe31"
    B: new HexSymbol "B", 5, "f463e8c63e"
    U: new HexSymbol "C", 5, "746108422e"
    DOT: new HexSymbol "DOT", 2, "f"

  display = new Display el.get("#canvas"), 80, 16
  display.setLiquidCrystal MT16S2H2FLA
#  display.setPreprocessor CutRenderPreprocessor

  window.display = display