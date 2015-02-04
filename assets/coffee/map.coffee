module.exports =
  init: (callback) ->
    L.mapbox.accessToken = 'pk.eyJ1IjoiYmFudGVyYWJpbGl0eSIsImEiOiJRT0o3ZUQ4In0.abdCim5EYTUPdEFdwuu_Ug'

    window.NN =
      layers: {}

    map = L.mapbox.map 'map', 'banterability.l36iphhm'
      .addEventListener 'load', ->
        callback map
