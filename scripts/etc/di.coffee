# light each function
each = (obj, context, handler) ->
  obj.forEach((handler||context).bind(context or this))

# registered dependencies
window.scope =
  services: {}
  controllers: []

# parse string of init service or controller (ex: name:dep1,dep2)
parseOptions = (options) ->
  [name, dependencies] = options.split /\s*:\s*/
  [name, if dependencies then dependencies.split(/\s*,\s*/) else []]

getInstance = (serviceName) ->
  if serviceName of scope.services
    service = scope.services[serviceName]
    deps = []
    each service.services, (serviceName) ->
      deps.push(getInstance(serviceName))
    service.factory.apply window, deps

############################
### REGISTER CONTROLLERS ###
############################
window.controller = (options, handler) ->
  [name, services] = parseOptions options

  scope.controllers.push
    name: name
    services: services
    handler: handler

#########################
### REGISTER SERVICES ###
#########################
window.service = (options, factory) ->
  [name, services] = parseOptions options

  scope["services"][name] =
    services: services
    factory: if typeof factory is "function" then factory else -> factory

#################
### BOOTSTRAP ###
#################
window.onload = ->
  each scope.controllers, (controller) ->
    deps = []
    each controller.services, (serviceName) ->
      deps.push(getInstance(serviceName))

    controller.handler.apply window, deps