service "CloseRenderPreprocessor:RenderPreprocessor", (RenderPreprocessor) ->
  class CloseRenderPreprocessor
    CloseRenderPreprocessor:: = new RenderPreprocessor
    constructor: (@width, @height) ->
    transform: (x, y) ->
      [ x % @width, y % @height ]