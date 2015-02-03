Draggable = require './draggable'
Map = require './map'
Slider = require './slider'

(init = ->
  Map.init (map) ->
    Draggable.init map
    Slider.init map
)()
