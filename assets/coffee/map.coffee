module.exports =
  init: (callback) ->
    L.mapbox.accessToken = '<your token here>'

    window.NN =
      layers: {}

    map = L.mapbox.map 'map', 'banterability.l36iphhm'
      .addEventListener 'load', ->
        NN.layers.trains = L.mapbox.featureLayer()
          .loadURL 'data/stations.json'
          .addTo map

        NN.layers.trainsOverlay = L.mapbox.featureLayer()
          .addTo map

        NN.layers.places = L.mapbox.featureLayer()
          .loadURL 'data/important_places.json'
          .addTo map

        NN.layers.placesOverlay = L.mapbox.featureLayer()
          .addTo map

        callback map
