
controller "main:el,MT16S2H2FLA,CharacterGenerator,Symbols,GraphicGenerator,GraphicObjects,Game",
(el,MT16S2H2FLA,CharacterGenerator,Symbols,GraphicGenerator,GraphicObjects,Game) ->

  # custom symbols
  symbols =
    A: new Symbols.Hexadecimal 5, "22a318fe31"
    B: new Symbols.Hexadecimal 5, "f463e8c63e"
    C: new Symbols.Hexadecimal 5, "746108422e"
    DOT: new Symbols.Hexadecimal 2, "f"
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

  ####################
  ### GAME DISPLAY ###
  ####################
  mountGame = el.get "#game"
  lcgm = new MT16S2H2FLA mountGame
  game = new Game lcgm
                                                           # walls
  game.addWall new GraphicObjects.Line [ [1,1],  [50,1]  ] # top
  game.addWall new GraphicObjects.Line [ [50,1], [50,16] ] # right
  game.addWall new GraphicObjects.Line [ [1,16], [50,16] ] # bottom
  game.addWall new GraphicObjects.Line [ [1,1],  [1,16]  ] # left

  game.addWall new GraphicObjects.Line [ [22,16], [22,6]  ] # 1

  game.init()
  game.start()

  window.game = game










