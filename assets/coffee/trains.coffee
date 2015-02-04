module.exports =
  init: (map) ->
    NN.layers.trains = L.mapbox.featureLayer()
      .loadURL 'data/stations.json'
      .addTo map

    NN.layers.trainsOverlay = L.mapbox.featureLayer()
      .addTo map
