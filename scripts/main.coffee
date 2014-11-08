
inject ["el", "utils", "MT16S2H2FLA"], (el, utils, MT16S2H2FLA) ->
  lc = new MT16S2H2FLA 80, 16

  lc.mount el.get "#canvas"

  lc.setPixel(2, 2)

  window.lc = lc