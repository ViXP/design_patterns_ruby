# CONCRETE PUBLISHER
require './observers'
require 'singleton'

class PasswordSendingMachine
  include Singleton

  @clients = []

  def self.register(client)
    @clients.push(client) if client.is_a?(Client) && !@clients.include?(client)
  end

  def self.unregister(client)
    @clients.delete(client) if client.is_a? Client
  end

  def self.notify!(data)
    threads = []
    @clients.each do |client|
      threads << Thread.new { client.update(data) }
    end
    threads.each(&:join)
  end
end
