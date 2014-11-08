
controller "main:el,HexSymbol,CharacterGenerator,MT16S2H2FLA,CloseRenderPreprocessor",
(el,HexSymbol,CharacterGenerator,MT16S2H2FLA,CloseRenderPreprocessor) ->

  symbols =
    A: new HexSymbol "A", 5, "22a318fe31"
    B: new HexSymbol "B", 5, "f463e8c63e"
    U: new HexSymbol "C", 5, "746108422e"
    DOT: new HexSymbol "DOT", 2, "f"

  mountPoint = el.get("#canvas")

  # build the emulator of liquid crystal display (model MT16S2H2FLA)
  lc = new MT16S2H2FLA mountPoint

  # build character generator
  cg = new CharacterGenerator lc

  cg.printSymbol symbols.A

