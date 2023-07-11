#client side command
#$ echo "Hello World" | nc -u 192.168.33.10 4321
#HELLO WORLD

#TCP example
require "socket"

host = "127.0.0.1"     # The web server
port = 3000                           # Default HTTP port
path = "/test.json"                 # The file we want

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host, port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers, body = response.split("\r\n\r\n", 2)
#print body                          # And display it

puts "#{path} downloaded: #{body}"
puts "now sending the data through the UDP"

#UDP example
BUFFER_SIZE = 1024

client = "10.0.0.184"
socket = UDPSocket.new
socket.bind(client, 4321)

loop do
  message, sender = socket.recvfrom(BUFFER_SIZE)

  port = sender[1]
  host = sender[2]

  socket.send("This app allows to transfer a hash value from ruby DB, then send to the client: #{client}\n", 0, host, port)
  socket.send("Server: #{host}:#{port}#{path} - " + body, 0, host, port)

  #socket.send(message, 0, host, port)
end
