
controller "main:el,MT16S2H2FLA,CharacterGenerator,Symbols,GraphicGenerator,GraphicObjects",
(el,MT16S2H2FLA,CharacterGenerator,Symbols,GraphicGenerator,GraphicObjects) ->

  # custom symbols
  symbols =
    A: new Symbols.Hexadecimal "A", 5, "22a318fe31"
    B: new Symbols.Hexadecimal "B", 5, "f463e8c63e"
    C: new Symbols.Hexadecimal "C", 5, "746108422e"
    DOT: new Symbols.Hexadecimal "DOT", 2, "f"
    SPACE: new Symbols.ControlSymbol CharacterGenerator.CONTROL_SYMBOL_INCREMENT
    NEWLINE:new Symbols.ControlSymbol CharacterGenerator.CONTROL_SYMBOL_NEWLINE

  #######################
  ### GRAPHIC DISPLAY ###
  #######################
  # get mount tag
  mountGraphic = el.get("#graphic")
  # build the emulator of liquid crystal display (model MT16S2H2FLA)
  lcg = new MT16S2H2FLA mountGraphic
  # build graphic generator
  gg = new GraphicGenerator lcg
  gg.render new GraphicObjects.Circle [ 7, 7, 5 ]

  #######################
  ### SYMBOLS DISPLAY ###
  #######################
  # get mount tag
  mountSymbols = el.get("#symbols")
  # build liquid crystal display
  lcs = new MT16S2H2FLA mountSymbols
  # build character generator
  cg = new CharacterGenerator lcs, 16, 2
  cg.printSymbol symbols.A
  cg.printSymbol symbols.SPACE
  cg.printSymbol symbols.B
  cg.printSymbol symbols.NEWLINE
  cg.printSymbol symbols.C









