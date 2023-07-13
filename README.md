# README

This is a personal project: Socket programming. This code will receive JSON data through TCP from the Ruby on Rails DB server. Then, it will send to the client IP through UDP. This may expand the functionality that transfers data to different platforms.

For a test, the client needs to run the following command in the terminal in order to receive a packet from the server:

Client-side
$ nc -u 192.168.x.x 4321  #Your IP address
("The Netcat ( nc ) command is a command-line utility for reading and writing data between two computer networks. The communication happens using either TCP or UDP.")


Server-side
$ ruby test4.rb

Both Server/Client can send/receive a message by UDPSocket.receive methods.

Ruby on rails controller:show in work.

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
