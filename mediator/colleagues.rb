# CONCRETE COLLEAGUES
require './mediator'

class Product
  def initialize title = '', price = '10'
    @title = title
    @price = price
    @status = :available
    unless LogisticsMachine.store(self)
      raise SecurityError, 'No storages for new products are affiliated!'
    end
  end

  def rent
    return false if @status == :rented
    @status = :rented if LogisticsMachine.rent(self)
  end

  def return
    return false if @status == :available
    @status = :available if LogisticsMachine.store(self)
  end

  def to_s
    <<~DESCRIPTION
      #{'*' * 30}
      Product name: #{@title}
      Price of rent: #{@price}$/day
      Status: #{@status}
    DESCRIPTION
  end
end

class Storage
  @@storage_count = 0

  attr_reader :products

  def initialize address = false, places = 250
    @@storage_count += 1
    @number = @@storage_count
    @products_count = 0
    @places = places
    @products = []
    @address = address
    LogisticsMachine.affiliate self
  end

  def clear_products
    @products = []
    @products_count = 0
  end

  def free_places
    @places - @products_count
  end

  def liquidate
    LogisticsMachine.liquidate self
  end

  def pickup product
    return false unless @products.delete(product)
    @products_count -= 1
  end

  def store product
    return false if @products_count >= @places
    @products << product
    @products_count += 1
  end

  def to_s
    <<~DESCRIPTION
      storage \##{@number}
      Address: #{@address || 'not specified'}
      Full capacity: #{@places} units
      Occupied: #{@products_count} units
      Free capacity: #{free_places} units
      #{'*' * 30}
    DESCRIPTION
  end
end