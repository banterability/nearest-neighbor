Utils = require './utils'

drawRadii = (layer, radius, options={}) ->
  dataLayer = NN.layers[layer]
  overlayLayer = NN.layers["#{layer}Overlay"]

  overlayLayer.setGeoJSON(
    turf.featurecollection(
      dataLayer.getGeoJSON().features.map (train) ->
        Utils.circleAroundPointWithRadius train, radius
    )
  )

drawRadiiWithIntersect = (layer, radius) ->
  dataLayer = NN.layers[layer]
  overlayLayer = NN.layers["#{layer}Overlay"]

  overlayLayer.setGeoJSON(
    Utils.multiIntersect(
      dataLayer.getGeoJSON().features.map (feature) ->
        Utils.circleAroundPointWithRadius feature, radius
    )
  )

module.exports =
  init: (map) ->
    [].forEach.call document.querySelectorAll('.slider'), (node) ->
      control = node.querySelector '.slider-control'
      readout = node.querySelector '.slider-readout'
      layer = control.dataset.layer;

      control.addEventListener 'input', (ev) ->
        readout.textContent = control.value
        try
          drawRadiiWithIntersect(layer, control.value)
        catch err
          console.log 'cannot intersect', err
          drawRadii(layer, control.value)
      , false
