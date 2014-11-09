service "GraphicObjects:utils", (utils) ->

  renders =

    #####################
    ### JUST OBJECT ###
    #####################
    Object: ->
      @map

    #####################
    ### LINE OBJECT ###
    #####################
    Line: ->

      # line points coords
      coords = []

      # count of steps
      steps = Math.max(Math.abs(@map[0][0] - @map[1][0]), Math.abs(@map[0][1] - @map[1][1]))

      # step direction
      stepX = (@map[1][0] - @map[0][0]) / steps
      stepY = (@map[1][1] - @map[0][1]) / steps

      # start point
      coords.push @map[0]

      # calc other points
      utils.repeat steps, (index) ->
        coord = coords[index]
        coords.push [ coord[0] + stepX , coord[1] + stepY ]

      coords

    #####################
    ### CIRCLE OBJECT ###
    #####################
    Circle: ->

      # coords
      coords = []
      [X, Y, R] = @map

      utils.repeat 361, (angle) ->
        coords.push [ X + R * Math.sin(angle + 1), Y + R * Math.cos(angle + 1) ]

      coords

    ######################
    ### JUST 3D OBJECT ###
    ######################
    Object3D: ->
      



  # generate obeject classes
  utils.collect renders, (render, name) ->
    class GraphicObject
      constructor: (@map) ->
      render: render