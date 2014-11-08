
controller "main:el,Symbols,ControlSymbol,CharacterGenerator,MT16S2H2FLA",
(el,Symbols,ControlSymbol,CharacterGenerator,MT16S2H2FLA) ->

  symbols =
    A: new Symbols.Hexadecimal "A", 5, "22a318fe31"
    B: new Symbols.Hexadecimal "B", 5, "f463e8c63e"
    C: new Symbols.Hexadecimal "C", 5, "746108422e"
    DOT: new Symbols.Hexadecimal "DOT", 2, "f"

  mountPoint = el.get("#canvas")

  # build the emulator of liquid crystal display (model MT16S2H2FLA)
  lc = new MT16S2H2FLA mountPoint

  # build character generator
  cg = new CharacterGenerator lc, 16, 2

  cg.printSymbol symbols.A
  cg.printSymbol new Symbols.ControlSymbol cg.CONTROL_SYMBOL_INCREMENT
  cg.printSymbol symbols.B
  cg.printSymbol new Symbols.ControlSymbol cg.CONTROL_SYMBOL_NEWLINE
  cg.printSymbol symbols.C


