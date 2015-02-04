module.exports =
  init: (map, options = {}) ->
    NN.layers.places = L.mapbox.featureLayer()
      .loadURL 'data/important_places.json'

    NN.layers.placesOverlay = L.mapbox.featureLayer()

    NN.layers.places.addTo map if options.markers
    NN.layers.placesOverlay.addTo map if options.overlays
