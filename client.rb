#example code testing
#https://www.jdeen.com/blog/basic-ruby-tcp-server-client-example

require "socket"

socket = TCPSocket.new("localhost", 8090)

while line = socket.gets
  puts line
end

socket.close
