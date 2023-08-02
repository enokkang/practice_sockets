# require "net/ping"

# index = 1

# while index <= 255
#   puts index

#   def up?(host)
#     check = Net::Ping::HTTP.new(host)
#     check.ping?
#   end

#   chost = "10.0.0.#{index}"
#   puts up?(chost)

#   index += 1
# end

require "socket"

ip = Socket.ip_address_list.detect { |intf| intf.ipv4_private? }
p ip.ip_address
