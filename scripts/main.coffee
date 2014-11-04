
# build symbols
symbols =
  A: new Symbol "A", 5, "22a318fe31"
  B: new Symbol "B", 4, "f463e8c63e"
  U: new Symbol "C", 5, "746108422e"
  DOT: new Symbol "DOT", 2, "f"

word2sym = (word) ->
  collect word.split(/\0?/), (letter) ->
    symbols[letter]

# build display
display = new Display(el.get("#canvas"), 80, 16, "mirror")
editor = new Editor display

display.printSymbol(symbols.U)

#motions = new Motions display, 100

#motions.motionRegister new Motion [symbols.A, symbols.B], (x: 0, y: 0), (x: 1, y: 1), true
#motions.motionRegister new Motion [symbols.DOT], (x: 0, y: 4), (x: 2, y: 0), true

#motions.start()

# share display
window.display = display
window.symbols = symbols
#window.editor = editor
#window.motions = motions