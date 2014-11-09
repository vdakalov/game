service "GraphicGenerator:utils,GraphicObject", (utils,GraphicObject) ->
  class GraphicGenerator
    liquidCrystal = null
    constructor: (lc) ->
      liquidCrystal = lc

    render: (object) ->
      map = do object.render
      utils.each map, (coord) ->
        liquidCrystal.setPixel coord[0], coord[1]



