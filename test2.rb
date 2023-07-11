require "socket"

BUFFER_SIZE = 1024

socket = UDPSocket.new
socket.bind("10.0.0.184", 4321)

loop do
  message, sender = socket.recvfrom(BUFFER_SIZE)

  port = sender[1]
  host = sender[2]

  socket.send("Your message has been modified: " + message.upcase, 0, host, port)
  socket.send("hihi", 0, host, port)
end
