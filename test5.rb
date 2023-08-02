#Client (sends the file) :
require ‘socket’
file = File.new(‘README.md’)
fileContent = file.read
sock = TCPSocket.open(‘localhost’, 2000)
sock.print fileContent
sock.close

#Server (receives the file) :
require ‘socket’
sock = TCPServer.open(2000)
con = sock.accept
msg = con.read
destFile = File.new(‘README.md’, ‘w’)
destFile.print msg
destFile.close
