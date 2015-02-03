module.exports =
  init: (callback) ->
    L.mapbox.accessToken = '<your token here>'

    window.NN = {}
    NN.layers = {}
    NN.mapObj = L.mapbox.map 'map', 'banterability.l36iphhm'
      .addEventListener 'load', ->
        NN.layers.trains = L.mapbox.featureLayer()
          .loadURL 'data/stations.json'
          .addTo NN.mapObj

        NN.layers.trainsOverlay = L.mapbox.featureLayer()
          .addTo NN.mapObj

        NN.layers.places = L.mapbox.featureLayer()
          .loadURL 'data/important_places.json'
          .addTo NN.mapObj

        NN.layers.placesOverlay = L.mapbox.featureLayer()
          .addTo NN.mapObj

        callback()
