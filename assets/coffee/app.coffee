Map = require './map'
Slider = require './slider'

(init = ->
  Map.init ->
    Slider.init()
)()
