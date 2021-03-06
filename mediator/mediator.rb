# CONCRETE MEDIATOR
require 'singleton'
require './colleagues'

class LogisticsMachine
  include Singleton

  @storages = []

  def self.affiliate(new_storage)
    @storages << new_storage if new_storage.is_a? Storage
  end

  def self.store(new_product)
    raise SecurityError, 'No storages are affiliated!' if @storages.empty?
    unloaded = @storages.first
    @storages.each do |storage|
      unloaded = storage if storage.free_places > unloaded.free_places
    end
    return false unless unloaded.store(new_product)
    puts "#{new_product} is stored in #{unloaded}"
    true
  end

  def self.rent(product)
    @storages.each do |storage|
      if storage.pickup(product)
        puts "#{product} is rented from #{storage}"
        return true
      end
    end
    false
  end

  def self.liquidate(storage)
    return false unless storage.is_a? Storage
    raise SecurityError, 'Can\'t liquidate sole storage, or no such storage' \
      unless @storages.count > 1 && @storages.delete(storage)
    puts "\e[31mTHE PROCCESS OF STORAGE LIQUIDATION IS STARTED...\e[0m"
    storage.products.each {|product| store(product) }
    storage.clear_products
    storage.freeze
    puts "\e[33mSTORAGE LIQUIDATION PROCCESS IS FINISHED.\e[0m"
  end
end
