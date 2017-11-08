# The young company offers the filmmaking equipment for rent (cameras in particular)
# for filmmakers with a different budgets. Mediator entity LogisticsMachine
# describes the logics of products transfers so products and storages are not
# coupled anymore and know nothing about this part of the logic.
# 
# MEDIATOR LogisticsMachine
# COLLEAGUES Product, Storage

require './colleagues'

# Instantiating the first class of colleagues
storage1 = Storage.new('1428 Elm Street, Springwood, Ohio', 50)
storage2 = Storage.new('3250 Orange Grove Avenue, Haddonfield, Illinois', 50)
storage3 = Storage.new('3600 Prospect Street, Georgetown, Washington D.C.', 20)

# Instantiating the second class of colleagues
camera1 = Product.new('ARRI Alexa Mini 4K', 600)
camera2 = Product.new('ARRI Alexa Mini 4K', 590)
camera3 = Product.new('RED Epic-W 8K', 450)
camera4 = Product.new('Blackmagic URSA Mini Pro. 4.6K', 100)
camera5 = Product.new('Blackmagic URSA Mini Pro. 4.6K', 95)
camera6 = Product.new('GoPro Hero 5 Black', 15)

# Do the mediator job
puts storage1.to_s # check the number of occupied positions
camera3.rent
puts camera3.to_s # will be rented
puts storage1.to_s # the number of free positions will decrease by 1
camera5.rent
camera3.return
sleep 5
storage1.liquidate # will shut one of the storages and move all products to other storages
camera5.return