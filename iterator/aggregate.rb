# CONCRETE AGGREGATE
require './iterators'

class Catalog
  attr_reader :items, :title, :on_page

  def initialize title, items = [], on_page = 3
    @title = title
    @items = items
    @on_page = on_page
  end

  def << item = Item.new
    @items << item
  end

  def to_s
    "#{title} catalog:\n#{'*' * (title.size + 9)}"
  end

  def iterator type = false
    if type == :item
      ItemIterator.new(self)
    else
      PageIterator.new(self, on_page)
    end
  end
end

class Item
  attr_reader :code, :brand, :title, :price, :currency, :description

  @@current_code = 10000

  def initialize brand, title, price, currency = '$', description = ''
    @@current_code += 1
    @code = @@current_code
    @brand = brand
    @title = title
    @price = price
    @description = description
    @currency = currency 
  end

  def price
    @price + currency
  end

  def to_s
    "Brand: #{brand}\nTitle: #{title} (code: #{code})\nDescription: #{description}\nPrice: #{price}\n\n"
  end

  private :currency
end