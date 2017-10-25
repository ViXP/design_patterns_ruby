# CONCRETE FACADE
require './classes'

class KitchenFacade
  def cook_the_soup
    # Components initialization
    water = Water.new
    salt = Salt.new
    potato = Potato.new(:medium_sized_cubes)
    onion = Onion.new(:yellow)
    carrot = Carrot.new(1, :frayed)
    # Full recipe
    Cook.start_cooking :soup
    Cook.get_pan
    water.pour 2
    water.boil
    Cook.get_dripping_pan
    onion.cut_and_add 1
    carrot.add_to_mix
    Cook.mix
    Cook.wait_for 5
    Cook.get_pan
    water.fill_in
    potato.load = 0.2
    Cook.mix
    Cook.wait_for 10
    salt.type = :common
    salt.pinch 0.03
    salt.salt!
    Cook.mix
    Cook.wait_for 5
    Cook.ready!
  end

  def cook_the_mashed_potatoes
    # Components initialization
    water = Water.new
    butter = Butter.new(100)
    potato = Potato.new(:big_sized_cubes)
    onion = Onion.new(:green)
    salt = Salt.new
    # Full recipe
    Cook.start_cooking 'mashed potatoes'
    Cook.get_dripping_pan
    onion.cut_and_add 1
    Cook.wait_for 5
    Cook.get_pan
    water.pour 1.5
    water.fill_in
    potato.load = 1
    salt.pinch 0.02
    salt.salt!
    Cook.mix
    water.boil
    Cook.wait_for 30
    onion.add
    Cook.wait_for 5
    butter.add
    Cook.mash
    Cook.ready!
  end
end