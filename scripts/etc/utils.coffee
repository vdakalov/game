service "utils",
  each: (obj, context, handler) ->
    index = 0
    [handler, obj, context] = [obj, this, null] if arguments.length is 1
    [handler, context] = [context, null] if arguments.length is 2
    if typeof obj is 'object' and obj isnt null and typeof handler is 'function'
      (
        # run handler with defined context
        if context then handler.call context, item, name, index++
        # run handler without context
        else handler item, name, index++
      ) for name, item of obj when obj.hasOwnProperty(name) and (name isnt 'length' or obj not instanceof Array)
    obj

  grep: (obj, context, handler) ->
    [handler, obj, context] = [obj, this, null] if arguments.length is 1
    [handler, context] = [context, null] if arguments.length is 2
    isArr = obj instanceof Array
    list = if isArr then [] else {}
    @each obj, context, (value, key, index) ->
      if handler.call(context, value, key, index) isnt no
        if isArr then list.push value else list[key] = value
    list

  collect: (obj, context, handler) ->
    [handler, obj, context] = [obj, this, null] if arguments.length is 1
    [handler, context] = [context, null] if arguments.length is 2
    isArr = obj instanceof Array
    list = if isArr then [] else {}
    @each obj, context, (value, key, index) ->
      result = if context then handler.call context, value, key, index
      else handler value, key, index
      list[key] = result if result isnt false
    list

  collectEntries: (obj, context, handler) ->
    [handler, obj, context] = [obj, this, null] if arguments.length is 1
    [handler, context] = [context, null] if arguments.length is 2
    list = {}
    @each obj, context, (value, key, index) ->
      result = if context then handler.call context, value, key, index
      else handler value, key, index
      list[result[0]] = result[1] if result isnt false
    list

  repeat: (num, context, handler) ->
    [handler, context] = [context, null] if arguments.length is 2
    @each (new Array(num)).join(".").split(/.?/), context, (value, key, index) ->
      if context then handler.call(context, index) else handler index

  trim: (string) ->
    string.replace(/^\s*|\s*$/g, '')

  interval: (delay, handler) -> setInterval handler, delay
  timeout: (delay, handler) -> setTimeout handler, delay

  coord2index: (width, x, y) ->
    ((y - 1) * width) + (x - 1)

  index2coord: (width, index) ->
    [(index % width) + 1, (index / width >> 0) + 1]

  instanceOf: (obj1, obj2) ->
    if obj1 and obj2
      fnc1 = if typeof obj1 is "function" then obj1.prototype.constructor else obj1.constructor
      fnc2 = if typeof obj2 is "function" then obj2.prototype.constructor else obj2.constructor
      fnc1.name is fnc2.name