# The pipe tobacco boutique which can blend the tobacco mixture from user recipe
# (the type of mixture must be defined and the weight of tobacco components),
# components may be added during the runtime also. As a bonus, the boutique
# will give a thematic free pipe for every customer.
#
# FACTORIES TobaccoBlendFactory: EnglishBlendFactory, AmericanBlendFactory,
#           ScottishBlendFactory, BalkanBlendFactory, DanishhBlendFactory,
#           VaperBlendFactory, VirginiaBlendFactory
# PRODUCTS TobaccoMixture: EnglishMixture, AmericanMixture, ScottishMixture,
#          BalkanMixture, DanishMixture, VirginiaMixture, VaperMixture
# COMPONENTS Tobacco: Virginia, Burley, Oriental, Cavendish, Kentucky,
#            Perique, Latakia

require './factories'

puts <<~WELCOME
  Welcome to our pipe tobacco blending shop! Which kind of mixture do you want
  to mix?
  A - American blend
  E - English blend
  S - Scottish blend
  B - Balkan blend
  D - Danish blend
  P - Va/Per blend
  V - Virginia blend
  Please, make your choice!
  P.S: For you we have a special prize - you'll get an exclusive tobacco pipe
  for each kind of blend today!
WELCOME

factory = TobaccoPipeFactory.use_factory(gets.chomp.slice(0, 1).capitalize)
tobacco = factory.make_blend! # product #1 created by factory
pipe = factory.make_pipe! # product #2 created by factory
tobacco.recipe
tobacco << Latakia.new # adding the component during the runtime
tobacco.recipe # shows the result recipe
pipe.specifications # shows the specs of a second product, created by factory
