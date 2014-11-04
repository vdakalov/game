class Motion

  moveHandler = ->
    # clear display
    do @display.clear

    # print symbols
    each @symbols, @, (symbol) ->
      @display.printSymbol symbol
      @display.setCursor @position.x + symbol.size + 1, @display.getCursor().y

    # chack on end
    if @position.x >= @to.x and @position.y >= @to.y
      clearInterval @time

    # move cursor
    @display.setCursor @position.x += @step.x, @position.y += @step.y

  constructor: (@display, @symbols, @from, @to, @speed) ->
    if @display instanceof Display
      @relative =
        x: Math.abs(@to.x - @from.x)
        y: Math.abs(@to.y - @from.y)

      @step =
        x: if @relative.x > @relative.y then 1 else @relative.x / @relative.y
        y: if @relative.y > @relative.x then 1 else @relative.y / @relative.x

      @position =
        x: @from.x
        y: @from.y

  reset: ->
    @position = x: @from.x, y: @from.y

  move: ->
    @time = interval @speed, moveHandler.bind @

  stop: ->
    clearInterval @time



window.Motion = Motion