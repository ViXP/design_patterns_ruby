# User can cook several dishes with the kitchen facade
# which manipulates several types of component classes
# with different methods and responsibility
# 
# FACADE KitchenFacade
# CLASSES Cook, Water, Salt, Potato, Onion, Carrot, Butter 

require './facade'

kitchen = KitchenFacade.new
kitchen.cook_the_soup # run the first method of facade
kitchen.cook_the_mashed_potatoes # run the second method of facade