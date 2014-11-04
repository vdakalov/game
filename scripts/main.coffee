
# build symbols
symbols =
  A: new Symbol "A", 5, "22a318fe31"
  B: new Symbol "B", 5, "f463e8c63e"


# build display
display = new Display(el.get("#canvas"), 80, 16, "mirror")
motion = new Motion display, symbols, (x: 0, y: 0), (x: 100, y: 50), 150
motion.move()

# register symbols
#display.printSymbol symbols.A

# share display
window.display = display