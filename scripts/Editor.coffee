class Editor

  currentSize = 0
  currentMap = []
  currentMask = ""

  min_x = 0
  min_y = 0
  max_x = 0
  max_y = 0


  handler = (index, event) ->
    _el = event.target
    if _el.parentNode is @canvas
      exist = index in currentMap is true
      if exist
        currentMap.splice(currentMap.indexOf(index), 1)
      else
        currentMap.push index
      el.class _el, "select", not exist
      console.info currentMap

  constructor: (@display) ->
    @width = @display.liquidCrystal.width
    @height = @display.liquidCrystal.height
    @canvas = @display.canvas

    min_x = @width
    min_y = @height

    el.class @canvas, "edit", true

    each @canvas.children, @, (child, key, index) ->
      if el.isEl child
        child.addEventListener("click", handler.bind(@, index), false)

    el.make("div", null, "Build", document.body)
    .addEventListener "click", =>
      # define max and min for X
      each currentMap, @, (num) ->
        x = num % @width
        if x < min_x then min_x = x
        if x > max_x then max_x = x

      # define size
      currentSize = (max_x - min_x) + 1

      # define normal map
      normalMap = []
      each currentMap, @, (index) ->
        x = index % @width
        y = index / @width >> 0

        if y < min_y then min_y = y
        if y > max_y then max_y = y

        pos = (y * currentSize) + (x + 1)
        normalMap[pos-1] = 1

      repeat currentSize * (max_y + 1), (index) ->
        normalMap[index] = if normalMap[index] is 1 then 1 else 0

      prompt("Copy map", parseInt(normalMap.join(""), 2).toString(16))





window.Editor = Editor