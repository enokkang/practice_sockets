require "socket"

socket = TCPSocket.new("localhost", 4321)

while line = socket.gets
  puts line
end

socket.close
