# CONCRETE CLIENT
require './singleton'

class Subscriber
  def initialize fl_name = nil, ph = nil
    @book = PhoneBook.new
    self.full_name = fl_name
    self.phone = ph
    @book << self
  end

  [:full_name, :phone].each do |var|
    define_method "#{var}=" do |val = nil|
      if val && val.is_a?(String)
        instance_variable_set "@#{var}", val
      else
        puts "Enter the new subscriber #{var}:"
        instance_variable_set "@#{var}", gets.chomp
      end
    end

    define_method "#{var}" do
      instance_variable_get "@#{var}"
    end
  end

  def phone_formatted
    "#{self.phone.slice(0,3)}-#{self.phone.slice(3,2)}-#{self.phone.slice(5,2)}"
  end
end