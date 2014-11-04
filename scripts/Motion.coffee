class Motion

  constructor: (@symbols, @from, @speed, @infinitely = false) ->

    @position =
      x: @from.x
      y: @from.y

  render: (display) ->
    if display instanceof Display

      # chack on end
      if @infinitely or (@position.x >= @to.x and @position.y >= @to.y)
        # change position
        @position.x += @speed.x
        @position.y += @speed.y

      # move cursor
      display.setCursor @position.x, @position.y

      # print symbols
      each @symbols, @, (symbol) ->
        display.printSymbol symbol
        display.setCursor @position.x + symbol.size + 1, display.getCursor().y

  reset: ->
    @position = x: @from.x, y: @from.y

class Motions
  frame_delay = null
  frame_display = null
  motions = []

  constructor: (display, delay) ->
    frame_delay = delay
    frame_display = display

  motionRegister: (motion) ->
    if motion instanceof Motion
      motions.push motion

  start: ->
    @time = interval frame_delay, ->
      frame_display.clear()
      each motions, (motion) ->
        motion.render display

  stop: ->
    clearInterval @time



window.Motions = Motions
window.Motion = Motion