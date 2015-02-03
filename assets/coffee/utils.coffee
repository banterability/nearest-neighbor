generateBearings = ->
  bearing = 0
  step = 5.625
  output = []

  output.push bearing

  while bearing < 180
    bearing += step
    output.push bearing

  bearing = -bearing

  while bearing < 0
    bearing += step
    output.push bearing

  output

module.exports =
  circleAroundPointWithRadius: (point, radius) ->
    polygonCoordinates = []

    generateBearings().forEach (bearing) ->
      polygonCoordinates.push turf.destination(point, radius, bearing, 'miles').geometry.coordinates

    return {
      type: 'Feature'
      geometry:
        coordinates: [polygonCoordinates]
        type: 'Polygon'
    }

  multiIntersect: (areas) ->
    while areas.length > 2
      firstArea = areas.shift()
      secondArea = areas.shift()
      areas.unshift turf.intersect(firstArea, secondArea)

    turf.intersect areas[0], areas[1]
