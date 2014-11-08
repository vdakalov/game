
inject ["el", "utils", "LiquidCrystal"], (el, utils, LiquidCrystal) ->
  lc = new LiquidCrystal 80, 16

  lc.mount el.get "#canvas"