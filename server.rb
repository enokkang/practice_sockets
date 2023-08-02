require "socket"

server = TCPServer.new 8090

connected_clients = []

ConnectedClient = Struct.new(:socket, :username)

def valid_nickname?(nickname, connected_clients)
  connected_clients.none? { |client| client.username == nickname }
end

def speak(msg, client, all_clients)
  all_clients.each do |other_client|
    next if other_client == client
    other_client.socket.puts msg
  end
end

loop do
  Thread.start(server.accept) do |client|
    client.puts "Welcome to my chat server! What is your nickname?"

    nickname = client.gets
    next if nickname.nil?

    # Check if nickname is valid
    nickname = nickname.chomp
    while !(valid_nickname?(nickname, connected_clients))
      client.puts "Sorry that username is already taken, please choose another"
      nickname = client.gets
      next if nickname.nil?
      nickname = nickname.chomp
    end

    connected_client = ConnectedClient.new(client, nickname)

    # Tell this client the names of the other clients
    other_client_names = connected_clients.map(&:username)
    client.puts "You are connected with #{connected_clients.length} other users: [#{other_client_names.join(",")}]"

    # Tell the other clients the name of this client
    speak("*#{nickname} has joined the chat*", connected_client, connected_clients)

    connected_clients << connected_client

    # Listen for input
    while line = client.gets
      line = line.chomp
      speak("<#{nickname}> #{line}", connected_client, connected_clients)
    end

    # Tell the other clients that this client has left
    connected_clients.delete(connected_client)
    speak("*#{nickname} has left the chat*", connected_client, connected_clients)
  end
end
