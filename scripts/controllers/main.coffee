
controller "main:el,MT16S2H2FLA,CharacterGenerator,Symbols,GraphicGenerator,GraphicObjects",
(el,MT16S2H2FLA,CharacterGenerator,Symbols,GraphicGenerator,GraphicObjects) ->

  symbols =
    A: new Symbols.Hexadecimal "A", 5, "22a318fe31"
    B: new Symbols.Hexadecimal "B", 5, "f463e8c63e"
    C: new Symbols.Hexadecimal "C", 5, "746108422e"
    DOT: new Symbols.Hexadecimal "DOT", 2, "f"

    SPACE: new Symbols.ControlSymbol CharacterGenerator.CONTROL_SYMBOL_INCREMENT
    NEWLINE:new Symbols.ControlSymbol CharacterGenerator.CONTROL_SYMBOL_NEWLINE

  mountPoint = el.get("#canvas")

  # build the emulator of liquid crystal display (model MT16S2H2FLA)
  lc = new MT16S2H2FLA mountPoint

  # build character generator
  cg = new CharacterGenerator lc, 16, 2
  cg.printSymbol symbols.A

  # build graphic generator
  gg = new GraphicGenerator lc
  gg.render new GraphicObjects.Line [ [1, 1], [55, 14] ]
  gg.render new GraphicObjects.Line [ [1, 14], [44, 1] ]






