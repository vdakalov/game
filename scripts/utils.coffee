window.each = (obj, context, handler) ->
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

window.grep = (obj, context, handler) ->
  [handler, obj, context] = [obj, this, null] if arguments.length is 1
  [handler, context] = [context, null] if arguments.length is 2
  isArr = obj instanceof Array
  list = if isArr then [] else {}
  each obj, context, (value, key, index) ->
    if handler.call(context, value, key, index) isnt no
      if isArr then list.push value else list[key] = value
  list

window.collect = (obj, context, handler) ->
  [handler, obj, context] = [obj, this, null] if arguments.length is 1
  [handler, context] = [context, null] if arguments.length is 2
  isArr = obj instanceof Array
  list = if isArr then [] else {}
  each obj, context, (value, key, index) ->
    result = if context then handler.call context, value, key, index
    else handler value, key, index
    list[key] = result if result isnt false
  list

window.collectEntries = (obj, context, handler) ->
  [handler, obj, context] = [obj, this, null] if arguments.length is 1
  [handler, context] = [context, null] if arguments.length is 2
  list = {}
  each obj, context, (value, key, index) ->
    result = if context then handler.call context, value, key, index
    else handler value, key, index
    list[result[0]] = result[1] if result isnt false
  list

window.repeat = (num, context, handler) ->
  [handler, context] = [context, null] if arguments.length is 2
  each new Array(num), context, (value, key, index) ->
    if context then handler.call(context, index) else handler index
