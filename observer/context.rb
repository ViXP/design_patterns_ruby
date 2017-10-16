# CONCRETE CONTEXT
require './publisher'
require 'singleton'

class SecuredTerminal
  include Singleton

  @publisher = PasswordSendingMachine

  def self.use
    print <<~TEXT
      ...............................
      \e[96mWelcome to the SecuredTerminal!\e[0m
      ...............................
      Please, specify the next public password for all subscribed clients:
    TEXT
    @password = gets
    self.send_pass!
  end

  def self.send_pass!
    @publisher.notify! @password
  end
end