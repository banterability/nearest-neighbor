Draggable = require './draggable'
Map = require './map'
Places = require './places'
Slider = require './slider'
Trains = require './trains'

(init = ->
  Map.init (map) ->
    Draggable.init map
    Places.init map
    Slider.init map
    Trains.init map
)()
