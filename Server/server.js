// Required files
var dgram = require("dgram");

// Temp variables 
var server  = dgram.createSocket("udp4");
var data;
var hosts = [];

// Incoming info type
const msgType = {
    create_host      : 0,
    join_host        : 1,
    stop_host        : 2,
    set_player_state : 3,
    get_host         : 4
}

// Player class
function player(x, y){
    this.x = x;
    this.y = y;
}

// Reciving and sending data
server.on("message", function(msg, rinfo){
    console.log("< " + String(msg));
    data = JSON.parse(msg);

    switch(data.type){
        case msgType.set_player_state:
            set_player_state(data, rinfo);
        break;

        case msgType.create_host :
            create_host(data, rinfo);
        break;
        
        case msgType.stop_host :
            stop_host(data, rinfo);
        break;

        case msgType.get_host :
            get_host(data, rinfo);
        break;

        case msgType.join_host :
            join_host(data, rinfo);
        break;
    }
});

// Send player info
function set_player_state(data, rinfo){

}

// Create hosts
function create_host(data, rinfo){
    var hostNumber = hosts.length;
    hosts.push([new player(0, 0)]);
    
    data.hostNumber = hostNumber;
    data.playerNumber = 0;

    server.send(JSON.stringify(data), rinfo.port, rinfo.address);
    console.table(hosts);
}

// Stop host
function stop_host(data, rinfo){
    var host_to_stop = hosts.indexOf(data.hostNumber);
    hosts.splice(host_to_stop, 1);

    data.res = "stopped";
    server.send(JSON.stringify(data), rinfo.port, rinfo.address );
    
    console.table(hosts);
}

// Get host
function get_host(data, rinfo){
    data.hosts = hosts;
    server.send(JSON.stringify(data), rinfo.port, rinfo.address );
}

function join_host(data, rinfo){

}

// Port to bind server to
server.bind(59975);

 