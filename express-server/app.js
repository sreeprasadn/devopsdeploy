var express = require('express');
var app = express();
var path = require('path');
var serverConfig = require('./serverConfig');


app.use(express.static(path.join(__dirname, './dist'))); //  "public" off of current is root

app.get('/', (req, res) => {
    res.sendFile(path.resolve(__dirname, './dist', 'index.html'));
});

app.listen(serverConfig.port, serverConfig.host, () => {
	console.log('Listening on : http://'+serverConfig.host+':'+serverConfig.port);
});
