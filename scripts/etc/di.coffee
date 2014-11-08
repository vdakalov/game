packets = {}

window.inject = (dependencies, handler) ->
  list = []
  (dependencies||[]).forEach (name) ->
    list.push packets[name] if name of packets
  handler.apply this, list

window.di = (name, injecting, handler) ->
  [name, injecting, handler] = if arguments.length is 2 then [name, [], injecting] else arguments
  if injecting.length
    handler = inject injecting, handler
  packets[name] = handler