#example code testing
#https://www.jdeen.com/blog/basic-ruby-tcp-server-client-example

require "socket"

server = TCPServer.new("localhost", 8090)

request_count = 0

loop do
  client = server.accept
  request_count += 1

  client.puts "Welcome! You are visitor ##{request_count}"
  client.puts "Time: #{Time.now}"

  client.close
end
