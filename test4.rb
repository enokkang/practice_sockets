#client side command
#$ echo "Hello World" | nc -u 192.168.33.10 4321
#HELLO WORLD

#TCP example
require "socket"
require "json"

#UDP example
BUFFER_SIZE = 1024                  # Set the buffer size for the packet?

client = "10.0.0.184"               # Set the destination IP addr
socket2 = UDPSocket.new              # Create a new UDP Socket

#"Each socket needs a unique address, the combination of IP Addr and port#"
#"The process of allocating a port to a socket is called 'binding'"
socket2.bind(client, 4321)           # Bind client IP address and port#

loop do
  #print "Please type a message: "

  #p socket.recvfrom(BUFFER_SIZE)
  message, sender = socket2.recvfrom(BUFFER_SIZE) # Receive a packet from client's command line

  #p sender # eg. ["AF_INET", 49524, "10.0.0.184", "10.0.0.184"]

  port2 = sender[1]                  # Extract port# eg. 49524
  host2 = sender[2]                  # Extract the sender's IP Addr

  puts "UDP Message Received from #{host2}:#{port2} : " + message #eg. hello\n

  socket2.send("This app allows to transfer a hash value from ruby DB, then send to the client: #{client}\n\n", 0, host2, port2)

  #socket2.send("Server: #{host}:#{port}#{path} - #{body}\n\nPlease type a message: ", 0, host, port)

  print "Please type a message: "
  #message2 = gets.chomp()
  message2 = "UDP MESSAGE TEST"

  socket2.send("UDP Message Received from #{host2}:#{port2} : #{message2}", 0, host2, port2)
end
