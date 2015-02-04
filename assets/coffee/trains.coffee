module.exports =
  init: (map, options = {}) ->
    NN.layers.trains = L.mapbox.featureLayer()
      .loadURL 'data/stations.json'

    NN.layers.trainsOverlay = L.mapbox.featureLayer()

    NN.layers.trains.addTo map if options.markers
    NN.layers.trainsOverlay.addTo map if options.overlays
