handleDrag = ->
  # no-op

module.exports =
  init: (map) ->
    draggableMarkerOptions =
      draggable: true
      icon: L.mapbox.marker.icon
        'marker-color': '#42b2ce'
        'marker-symbol': 'building'
        'marker-size': 'large'

    draggable = L.marker map.getCenter(), draggableMarkerOptions
      .addEventListener 'drag', handleDrag, false
      .addTo map
