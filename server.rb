#based on https://www.jdeen.com/blog/basic-ruby-tcp-server-client-example

require "socket"

server = TCPServer.new("localhost", 4321)

request_count = 0

loop do
  client = server.accept
  request_count += 1

  client.puts "Current Time: #{Time.now} - Visitor Count ##{request_count}"

  client.close
end
