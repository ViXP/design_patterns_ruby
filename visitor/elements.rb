# COMMON ELEMENTS INTERFACES
require './visitors'

module Visitable
  def accept visitor
    visitor.visit(self) if visitor.respond_to? :visit
  end
end

module Purchasable
  attr_accessor :bought

  def bought 
    @bought || false
  end
end

# CONCRETE ELEMENTS
class Weapon
  include Visitable
  include Purchasable

  attr_reader :brand, :description, :package_type
  attr_accessor :department, :material, :stock_material, :made_in, :price

  def initialize brand, department, description, material, stock_material, made_in, package_type = :plastic, price
    @brand = brand
    @department = department
    @description = description
    @material = material
    @stock_material = stock_material
    @made_in = made_in
    @price = price
    @package_type = package_type
  end
end

class Dinnerware
  include Visitable
  include Purchasable

  attr_reader :type, :color, :number_of_pieces, :price_per_product

  def initialize type, color, number_of_pieces, price_per_product
    @type = type
    @color = color
    @number_of_pieces = number_of_pieces
    @price_per_product = price_per_product
  end

  def full_price
    @number_of_pieces * @price_per_product
  end
end