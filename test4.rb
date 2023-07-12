#client side command
#$ echo "Hello World" | nc -u 192.168.33.10 4321
#HELLO WORLD

#TCP example
require "socket"

host = "127.0.0.1"                  # The server IP address
port = 3000                         # The server port
path = "/test.json"                 # The file we want

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n" #HTTP GET request \r\n\r\n is required for HTTP requests?

#p request                          # Display request
socket = TCPSocket.open(host, port) # Connect to server TCP
socket.print(request)               # Send GET request to the server
#p socket                            # Display TCP socket
response = socket.read              # Read complete response

#p response                          # Display entire packet

#Find \r\n\r\n and split and select the 2nd one
headers, body = response.split("\r\n\r\n", 2)

#print body                          # And display it

puts "#{path} downloaded: #{body}"
puts "Now sending the data through the UDP"

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

  p "Message Received : " + message #eg. hello\n
  #p sender # eg. ["AF_INET", 49524, "10.0.0.184", "10.0.0.184"]

  port = sender[1]                  # Extract port# eg. 49524
  host = sender[2]                  # Extract the sender's IP Addr

  socket2.send("This app allows to transfer a hash value from ruby DB, then send to the client: #{client}\n\n", 0, host, port)

  #socket2.send("Server: #{host}:#{port}#{path} - #{body}\n\nPlease type a message: ", 0, host, port)

  print "Please type a message: "
  message2 = gets.chomp()

  socket2.send("Message Received : #{message2}\n\nPlease type a message: ", 0, host, port)
end
