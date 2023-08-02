#Client (sends the file) :
require ‘socket’
file = File.new(‘file.jpg’)
fileContent = file.read
sock = TCPSocket.open(‘localhost’, 2000)
sock.print fileContent
sock.close



#Server (receives the file) :
require ‘socket’
sock = TCPServer.open(2000)
con = sock.accept
msg = con.read
destFile = File.new(‘file-received.jpg’, ‘w’)
destFile.print msg
destFile.close