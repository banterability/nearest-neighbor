module.exports =
  init: (map) ->
    NN.layers.places = L.mapbox.featureLayer()
      .loadURL 'data/important_places.json'
      .addTo map

    NN.layers.placesOverlay = L.mapbox.featureLayer()
      .addTo map
