var fs = require('fs');
var http = require('http');

var server = http.createServer(function(req, res){
  if(req.url === '/'){
    res.writeHead(200, {'Content-Type': 'text/html'});
    fs.createReadStream('index.html').pipe(res);
  } else {
    res.writeHead(404, {'Content-Type': 'text/plain'});
    res.end('file not found');
  }
});

server.listen(5678);
