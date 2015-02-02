NN = {};
NN.Utils = {
  circleAroundPointWithRadius: function(point, radius){
    var polygonCoordinates = [];

    NN.Utils.generateBearings().forEach(function(bearing){
      var destinationPoint = turf.destination(point, radius, bearing, 'miles');
      polygonCoordinates.push(turf.destination(point, radius, bearing, 'miles').geometry.coordinates);
    });

    return {
      type: "Feature",
      geometry: {
        coordinates: [polygonCoordinates],
        type: "Polygon"
      }
    };
  },
  generateBearings: function() {
    var bearing = 0, output = [], step = 5.625;

    output.push(bearing);

    while(bearing < 180){
      bearing += step;
      output.push(bearing);
    }

    bearing = -bearing;

    while(bearing < 0){
      bearing += step;
      output.push(bearing);
    }
    return output;
  },
  multiIntersect: function(areas){
    while(areas.length > 2){
      firstArea = areas.shift();
      secondArea = areas.shift();
      areas.unshift(turf.intersect(firstArea, secondArea));
    }
    return turf.intersect(areas[0], areas[1]);
  }
};
