var express	= require('express'),
    app			= express();

var server  = require('http').createServer(app),
    path 		= require('path');

app.set('port', process.env.PORT || 9002);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(express.static(path.join(__dirname, 'public')));

// root
app.get('/', function(request, response) {
  response.render('index');
});

// start the demo
app.post('/start', function(request, response) {
  var fs = require('fs');
  fs.writeFile("/tmp/collamine", "", function(err) {
    if(err) { return console.log(err); }
    console.log("The file was saved on " + new Date().toUTCString());
    response.render('status', {status:"started"});
  });
});

// 404
app.use(function(request, response) {
  response.render('404', {url:request.url});
});

server.listen(app.get('port'), function() {
  console.log('collamine-demo server listening on port ' + app.get('port'));
});

