service "Game:utils,GraphicGenerator,CharacterGenerator,Symbols", (utils,GraphicGenerator,CharacterGenerator,Symbols) ->
  class Game

    # libs
    liquidCrystal = null
    graphicGenerator = null
    characterGenerator = null

    # scopes
    walls = []

    # game state
    state =
      entity: [2,2]
      vector: [1,0]
      blink: 1
      blinkLiveFreq: 2
      blinkDeadFreq: 6
      health: 100

    renderWalls = ->
      utils.each walls, (wall) ->
        graphicGenerator.render wall

    renderEntity = ->
      if ++state.blink % (if state.health then state.blinkLiveFreq else state.blinkDeadFreq)
        liquidCrystal.setPixel.apply liquidCrystal, state.entity

    renderHealth = ->
      characterGenerator.setCursor(51, 1)
      characterGenerator.printSymbol(symbols.h)
      characterGenerator.printSymbol(symbols.colon)
      String(state.health).replace /\d/g, (num) ->
        characterGenerator.printSymbol(symbols["dec#{num}"])

    render = ->
      liquidCrystal.clear()
      renderWalls()
      renderEntity()
      renderHealth()

    start = ->
      utils.collect timers, (params) ->
        if params.timer
          clearInterval params.timer
        params.timer = setInterval params.handler, params.interval
        params

    stop = ->
      utils.collect timers, (params) ->
        if params.timer
          params.timer = clearInterval params.timer
        params

    init = ->
      utils.each state, (value, name) ->
        if name.substr(0,1) isnt "_"
          state["_#{name}"] = value

    testMove = (x, y) ->
      result = true

      # test display outsize
      if (x <= 0 or x >= liquidCrystal.width) or
          (y <= 0 or y >= liquidCrystal.height)
        result = false

      else
        utils.each walls, (wall) ->
          utils.each wall.render(), (coords) ->
            result = false if coords[0] is x and coords[1] is y

      result

    timers =

      live:
        interval: 10000
        handler: ->
          if state.health
            state.health--

      render:
        interval: 100
        handler: render

      move:
        interval: 500
        handler: ->
          if state.health
            [x, y] = state.entity
            if testMove(x + state.vector[0], y + state.vector[1])
              state.entity = [x + state.vector[0], y + state.vector[1]]

      vector:
        interval: 5000
        handler: ->
          dirs = [-1,0,1]
          state.vector = [dirs[Math.random()*3 >> 0],dirs[Math.random()*3 >> 0]]

    symbols =
      h: new Symbols.Hexadecimal 4, "99f99"
      colon: new Symbols.Hexadecimal 1, "12"
      dec0: new Symbols.Hexadecimal 4, "69bd6"
      dec1: new Symbols.Hexadecimal 3, "1749"
      dec2: new Symbols.Hexadecimal 4, "f9f8f"
      dec3: new Symbols.Hexadecimal 4, "f1f1f"
      dec4: new Symbols.Hexadecimal 4, "99f11"
      dec5: new Symbols.Hexadecimal 4, "f8f1f"
      dec6: new Symbols.Hexadecimal 4, "f1f9f"
      dec7: new Symbols.Hexadecimal 3, "72c9"
      dec8: new Symbols.Hexadecimal 4, "f9f9f"
      dec9: new Symbols.Hexadecimal 4, "f9f1f"


    constructor: (lc) ->
      liquidCrystal = lc
      graphicGenerator = new GraphicGenerator lc
      characterGenerator = new CharacterGenerator lc, 20, 2

    addWall: (object) ->
      walls.push object

    init: -> do init; true
    start: -> do start; true
    stop: -> do stop; true




