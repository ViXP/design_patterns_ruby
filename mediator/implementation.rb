# The young company offers the filmmaking equipment for rent (cameras in
# particular) for filmmakers with a different budgets. Mediator entity
# LogisticsMachine describes the logics of products transfers so products and
# storages are not coupled anymore and know nothing about this part of a logic.
#
# MEDIATOR LogisticsMachine
# COLLEAGUES AbstractColleague: Product, Storage

require './colleagues'

# Instantiating the first class of colleagues:
storage1 = Storage.new('1428 Elm Street, Springwood, Ohio', 50)
Storage.new('3250 Orange Grove Avenue, Haddonfield, Illinois', 50)
Storage.new('3600 Prospect Street, Georgetown, Washington D.C.', 20)

# Instantiating the second class of colleagues:
camera1 = Product.new('RED Epic-W 8K', 450)
camera2 = Product.new('Blackmagic URSA Mini Pro. 4.6K', 95)
Product.new('Blackmagic URSA Mini Pro. 4.6K', 100)
Product.new('GoPro Hero 5 Black', 15)
Product.new('ARRI Alexa Mini 4K', 600)
Product.new('ARRI Alexa Mini 4K', 590)

# Do the mediator job:
puts storage1.to_s # check the number of occupied positions
camera1.rent
puts camera1.to_s # will be rented
puts storage1.to_s # the number of free positions will decrease by 1
camera2.rent
camera1.return
sleep 5

# This will shut one of the storages and move all products to other storages:
storage1.liquidate
camera2.return
