class Pixel
  constructor: (@x, @y) ->
    @el = el "div", {id: "x#{@x}y#{@y}"}

class Display
  constructor: (@width, @height) ->
    repeat @width * @height, @, (index) -> new Pixel(index % @width, index / 16 >> 0)
