el =
  get: document.querySelector.bind document
  getAll: document.querySelectorAll.bind document
  make: (tagName, attrs, body, parent) ->
    el = if tagName instanceof HTMLElement then tagName else document.createElement tagName
    each attrs or {}, (value, key) -> el.setAttribute key, value
    el.innerHTML = body if typeof body is "string"
    el.appendChild parent if parent instanceof HTMLElement
    el
