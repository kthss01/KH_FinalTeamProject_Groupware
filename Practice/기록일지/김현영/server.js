

/*
const { appendFile } = require('fs');
const http = require('http');
const server = http.createServer(function(require, response){
    response.end('socket.io');

    
});

//thread
server.listen(200);
*/



var express = require('express');
var app = express();
var http = require('http').Server(app); //1
var io = require('socket.io')(http);    //1

app.get('/',function(req, res){  //2
  res.sendFile(__dirname + '/client.html');
});

var count=1;
io.on('connection', function(socket){ //3
  console.log('user connected: ', socket.id);  //3-1
  var name = "user" + count++;                 //3-1
  io.to(socket.id).emit('change name',name);   //3-1

  socket.on('disconnect', function(){ //3-2
    console.log('user disconnected: ', socket.id);
  });

  socket.on('send message', function(name,text){ //3-3
    var user = name; 
    var msg = text;
    console.log(user);
    console.log(msg);
    io.emit('receive message', user,msg);

  
 socket.on('change name',function(newName){

    

 })


  });
});
http.listen(3000, function(){ //4
  console.log('s- on');
});





