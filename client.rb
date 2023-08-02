require "socket"

socket = TCPSocket.new("localhost", 8090)

while line = socket.gets
  puts line
end

socket.close
