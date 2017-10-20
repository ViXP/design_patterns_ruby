# Skateboards shop can build brand skates and great custom skates
# 
# DIRECTORS SkateboardBuilderDirector: ZeroSkateboardBuilderDirector, BlindSkateboardBuilderDirector, CustomSkateboardBuilderDirector
# BUILDER SkateboardBuilder
# PRODUCT Skateboard
# COMPONENTS SkateComponent: Deck, Truck, Bearing, Wheel, GripTape

require './directors'

skate1 = ZeroSkateboardBuilderDirector.construct # build the product #1
skate2 = BlindSkateboardBuilderDirector.construct # build the product #2
skate3 = CustomSkateboardBuilderDirector.construct # build the product #3
skate1.full_info # shows the info about the products and their components
skate2.full_info
skate3.full_info