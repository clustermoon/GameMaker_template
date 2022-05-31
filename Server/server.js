var dgram = require("dgram");

var server  = dgram.createSocket("udp4");
var data;

server.on("message", function(msg, rinfo){
    data = JSON.parse(msg);
});

server.bind(59975);

 