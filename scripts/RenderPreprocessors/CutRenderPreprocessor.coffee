service "CutRenderPreprocessor:RenderPreprocessor", (RenderPreprocessor) ->
  class CutRenderPreprocessor
    CutRenderPreprocessor:: = new RenderPreprocessor
    constructor: (@width, @height) ->

    transform: (x, y) ->
      [x, y]