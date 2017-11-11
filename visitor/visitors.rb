# ABSTRACT VISITOR
require './elements'

class Visitor
  def self.visit element
    self.send(:"visit_#{element.class.name.downcase}", element)
  end
end

# CONCRETE VISITORS
class PackagerVisitor < Visitor
  def self.visit_weapon weapon
    puts "Bringing the package for #{weapon.brand} (#{weapon.package_type})..."
    pay_off weapon
  end

  def self.visit_dinnerware products
    puts "Packaging the dinnerware (complect of #{products.color} #{products.type} " \
      "- #{products.number_of_pieces} objects) in the carton box..."
    pay_off products
  end

  private

  def self.pay_off product    
    sleep 5
    if product.bought=(true)
      puts "\e[33mYour package is ready!\e[0m"
    else
      puts "\e[31mSorry, but we can not finish operation\e[0m"
    end
  end
end

class AssistantVisitor < Visitor
  def self.visit_weapon weapon
    puts 'You see this? This... is my BOOMSTICK! ' \
      "#{weapon.description} #{weapon.brand}. S-Mart's top of the line. " \
      "You can find it in the #{weapon.department} department. That's right. " \
      "This sweet baby was made in #{weapon.made_in}. Retails for about "\
      "#{weapon.price}. It's got a #{weapon.stock_material} stock, #{weapon.material}."
    say_slogan
  end

  def self.visit_dinnerware products
    puts 'Well hello Mister Fancypants. ' \
      "What are you going to buy is just a bunch of #{products.color} #{products.type}, " \
      "retail price is #{products.price_per_product} for a single... thing. " \
      'If you can\'t do the math - go ahead and run. Run home and cry to mama! ' \
      "Ummm... Anyway, the full price is #{products.full_price}$, so... Come get some."
    say_slogan
  end

  private

  def self.say_slogan
    puts 'Shop smart! SHOP "S-MART". You got that?'
    puts '*' * 50
  end
end