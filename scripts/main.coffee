
display = new Display(el.get("#canvas"), 80, 16)

display.addSymbol "A", 5, "22a318fe31"
display.addSymbol "B", 5, "f463e8c63e"


display.printSymbol "A"
display.setCursor 5, 0
display.printSymbol "B"

window.display = display