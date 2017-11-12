# The buyer can buy certain types of different products in a housewares store,
# as well as ask one of the shop assistants to tell more about the products,
# by using the two types of visitors classes.
#
# VISITORS Visitor: PackagerVisitor, AssistantVisitor
# ELEMENTS Weapon, Dinnerware

require './visitors'

# Creating the elements:
gun = Weapon.new('Remington', :sporting_goods, {
  description: 'The 12-gauge double-barreled',
  material: 'cobalt blue steel',
  stock_material: :walnut,
  made_in: 'Grand Rapids, Michigan'
}, :wooden_box, 109.95)
plates = Dinnerware.new(:plates, :lightblue, 4, 2)

# The application of the first visitor to the elements:
gun.accept(AssistantVisitor)
plates.accept(AssistantVisitor)

# The application of the second visitor to the elements:
gun.accept(PackagerVisitor)
plates.accept(PackagerVisitor)
