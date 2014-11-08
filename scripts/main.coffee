
controller "main:el,HexSymbol,Display", (el,HexSymbol,Display) ->

  symbols =
    A: new HexSymbol "A", 5, "22a318fe31"
    B: new HexSymbol "B", 4, "f463e8c63e"
    U: new HexSymbol "C", 5, "746108422e"
    DOT: new HexSymbol "DOT", 2, "f"

  display = new Display el.get("#canvas"), 80, 16

  display.printSymbol(symbols.A)

  window.display = display