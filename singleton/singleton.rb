# CONCRETE SINGLETON
require 'date'

class PhoneBook
  @instance = nil

  def self.new
    @instance ||= super
  end

  attr_reader :catalog

  def initialize
    @subscribers = []
    @catalog = []
  end

  def <<(subscriber)
    @subscribers << subscriber
    @catalog << {
      name: subscriber.full_name,
      phone: subscriber.phone_formatted,
      subscribed_date: DateTime.new
    }
  end

  def self.show_book
    @instance.catalog
  end

  def self.close_book!
    @instance.method(:freeze).call
    @instance.frozen?
  end

  private_class_method :freeze, :clone, :dup
  private :clone, :dup

  private

  def freeze
    super
    @subscribers.freeze
    @catalog.freeze
  end
end
