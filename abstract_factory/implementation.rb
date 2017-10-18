# The pipe tobacco boutique which can blend the tobacco mixture from user recipe
# (the type of mixture must be defined and the weight of tobacco components).
# components may be added during the runtime also
# 
# FACTORIES TobaccoBlendFactory: EnglishBlendFactory, AmericanBlendFactory, ScottishBlendFactory, BalkanBlendFactory, DanishhBlendFactory, VaperBlendFactory, VirginiaBlendFactory
# PRODUCTS TobaccoMixture: EnglishMixture, AmericanMixture, ScottishMixture, BalkanMixture, DanishMixture, VirginiaMixture, VaperMixture
# COMPONENTS Tobacco: Virginia, Burley, Oriental, Cavendish, Kentucky, Perique, Latakia

require './factories'

puts <<~WELCOME
  'Welcome to our pipe tobacco blending shop! Which kind of mixture do you want to mix?
  A - American blend
  E - English blend
  S - Scottish blend
  B - Balkan blend
  D - Danish blend
  P - Va/Per blend
  V - Virginia blend
  Please, make your choice!'
WELCOME

tobacco = TobaccoBlendFactory.make_tobacco(gets.tr("\tr", '').slice(0,1).capitalize)
tobacco.recipe
tobacco << Latakia.new # adding the component during the runtime
tobacco.recipe # shows the result recipe