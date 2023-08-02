require "socket"
TIMEOUT = 1

def scan_port(ip)
  socket = Socket.new(:INET, :STREAM)
  remote_addr = Socket.sockaddr_in(80, ip)
  begin
    socket.connect_nonblock(remote_addr)
  rescue Errno::EINPROGRESS
  end
  _, sockets, _ = IO.select(nil, [socket], nil, TIMEOUT)
  if sockets
    p "IP: #{ip} is open"
  else
    # Port is closed
  end
rescue Errno::EHOSTUNREACH
rescue Errno::ETIMEOUT
rescue (Errno::ECONNREFUSED)
rescue Errno::ETIMEOUT
end

PORT_LIST = [21, 22, 23, 25, 53, 80, 443, 3306, 8080]
threads = []
#PORT_LIST.each { |i| threads << Thread.new { scan_port(i) } }
#threads.each(&:join)

index = 1
until index == 255
  scan_port("10.0.0.#{index}")
  index += 1
end
