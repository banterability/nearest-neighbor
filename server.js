var fs = require('fs');
var http = require('http');

var server = http.createServer(function(req, res){
  console.log("<-- " + req.url);
  if(req.url === '/'){
    res.writeHead(200, {'Content-Type': 'text/html'});
    console.log(" --> [html] 200");
    fs.createReadStream('index.html').pipe(res);
  } else if(urlMatch = req.url.match(/\/data\/(.*\.json)/m)) {
    res.writeHead(200, {'Content-Type': 'application/json'});
    console.log(" --> [json] 200");
    fs.createReadStream('./data/' + urlMatch[1]).pipe(res);
  } else {
    res.writeHead(404, {'Content-Type': 'text/plain'});
    console.log(" --> 404");
    res.end('file not found');
  }
});

server.listen(5678);
console.log('Server up on port 5678…');
