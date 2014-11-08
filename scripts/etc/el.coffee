service "el:utils", (utils) ->

  isEl: (el) -> el instanceof HTMLElement

  get: document.querySelector.bind document

  getAll: document.querySelectorAll.bind document

  make: (tagName, attrs, body, parent) ->
    el = if @isEl tagName then tagName else document.createElement tagName
    utils.each attrs or {}, (value, key) -> el.setAttribute key, value
    el.innerHTML = body if typeof body is "string"
    parent.appendChild el if @isEl parent
    el

  style: (el, style, value) ->
    if arguments.length is 3
      el.style[style] = value
    el.style[style]

  styles: (el, rules) ->
    utils.each rules, @, (value, rule) ->
      el.style[rule] = value

  class: (el, className, turn) ->
    new RegExp(className).test(el.className)
    if arguments.length > 2
      el.className = utils.trim(el.className.replace(new RegExp("(^|\s)#{className}($|\s)"), " "))
      if turn is true
        el.className = utils.trim("#{el.className} #{className}")
    else
      new RegExp(className).test(el.className)




