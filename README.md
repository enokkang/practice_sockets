# README

This is a personal project: Socket programming Practice.

Server-side

$ruby demo.rb
This code will receive JSON data through TCP from the Ruby on Rails DB server. Then, it will send to the client IP through UDP. This may expand the functionality that transfers data to different platforms.

AND
$ruby server.rb
This is a TCP server that counts numbers

For a test, the client needs to run the following command in the terminal in order to receive a packet from the server:

Client-side
$ nc -u 192.168.x.x 4321  #Your IP address
("The Netcat ( nc ) command is a command-line utility for reading and writing data between two computer networks. The communication happens using either TCP or UDP.")

OR (Command Prompt)
$ruby client.rb
This reads TCP socket data from the server.

OR (GUI)
localhost:3000/receive
This is a TCP client that shows counted numbers.


* Ruby version
ruby 3.2.2 (2023-03-30 revision e51014f9c0) [arm64-darwin22]
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
