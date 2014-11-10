service "Symbols:utils", (utils) ->

  ControlSymbol:
    class ControlSymbol
      type: "control"
      constructor: (@command) ->

  Binary:
    class Binary
      type: "char"
      constructor: (@size, @mask) ->

  Hexadecimal:
    class Hexadecimal

      type: "char"

      hex2bin = (size, mask) ->
        # translate to bin
        mask = parseInt(mask, 16).toString(2)
        # make empty mask with normal length
        normalMask = new Array((Math.ceil(mask.length / size) * size) + 1).join(0)
        # apply take mask to normal mask
        mask = normalMask.replace(new RegExp("\\d{0,#{mask.length}}$"), mask).split(/\0?/)
        @mask = utils.collect mask, (bit) -> +bit

      constructor: (@size, mask) ->
        @mask = hex2bin @size, mask
