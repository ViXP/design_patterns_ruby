# The secured terminal which notifies a bunch of different kind of clients with 
# a new public password. And after receiving the new public password every client regenerates 
# its own private password with its own algorithm defined by class.
# 
# CONTEXT SecureTerminal
# OBSERVERS Client: Base64Client, SHA256Client, HEXClient, MD5Client
# PUBLISHER PasswordSendingMachine

require './context'
require './publisher'
require './observers'

# Creating the random observers (clients)
1000.times do
  rand_client = rand 1..4
  case rand_client
    when 1 then Base64Client.new
    when 2 then SHA256Client.new
    when 3 then HEXClient.new
    else MD5Client.new
  end
end

SecuredTerminal.use # Running the terminal for a new public password creating
