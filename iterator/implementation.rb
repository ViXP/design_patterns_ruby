# There is a shop of swimming accessories (goggles). User can go through its
# products one by one or by page using the object returned with iterator method
# of catalog.
#
# AGGREGATE Catalog
# ITERATORS Iterator: ItemIterator, PageIterator

require './aggregate'

swimming_goggles = Catalog.new('Goggles for swimming')
swimming_goggles << Item.new(
  'Speedo',
  'V-Class Vue Mirror Goggle',
  '70', '€',
  'Qfit™ is Speedo’s most technologically advanced goggle, with an unbeaten '\
  'fit that offers complete confidence, both in the pool and off the blocks.')
swimming_goggles << Item.new(
  'Speedo',
  'Futura Biofuse Goggle',
  '23', '€',
  'Speedo gave their research and development team a challenge they couldn’t ' \
  'refuse: To develop a goggle so comfortable, you’d almost forget you were ' \
  'wearing them. The result is their ground-breaking Speedo Biofuse® ' \
  'technology, which offers optimum goggle comfort.')
swimming_goggles << Item.new(
  'Speedo',
  'Mariner Optical Goggle',
  '22', '€',
  'Whether you\'re swimming for fitness or for fun, Mariner Optical goggle ' \
  'allows you to enjoy corrected vision and get more from your swim.')
swimming_goggles << Item.new(
  'Speedo',
  'Fastskin Elite Goggle',
  '43', '€',
  'Maximum comfort, a hydrodynamic profile and wide peripheral vision with ' \
  'less head movement make the Elite Goggle a key weapon in the armoury of ' \
  'the serious swimmer.')
swimming_goggles << Item.new(
  'Speedo',
  'Swedish Mirror Goggle',
  '17', '€',
  'Be race ready. You can self-assemble this traditional racing goggle for a ' \
  'bespoke fit.')
swimming_goggles << Item.new(
  'Speedo',
  'Fastskin Elite Mirror Goggle',
  '54', '€',
  'Introducing the fastest, most hydrodynamic goggle ever. Designed for the ' \
  'world’s top athletes, this mirrored competition goggle includes the most ' \
  'advanced IQfit™ technology for the ultimate leak-free, precision fit and ' \
  'performance.')
swimming_goggles << Item.new(
  'TYR',
  'Vesi Goggles',
  '15', '$',
  'Lightweight and streamlined, the Vesi\'s watertight construction includes '\
  'Durafit silicone gaskets, wide peripheral range and speed adjust ' \
  'technology for easy on and off wear.')
swimming_goggles << Item.new(
  'Arena',
  'Cobra Core Mirror Racing Goggles',
  '25', '£',
  'The Cobra Core mirror goggles have low profile mirror lenses, high-tech ' \
  'moulding and a blade shape. The design of the Cobra Core minimizes drag ' \
  'and improves glide in a sleek, watertight design.')
swimming_goggles << Item.new(
  'Arena',
  'Fluid Training Goggles',
  '14.5', '£',
  'Arena Fluid training goggles are prefect for those who want a super ' \
  'comfortable fit which is provided in the form of a liquid silicone seal.')
swimming_goggles << Item.new(
  'Arena',
  'Swedix Mirror Race Swim Goggle',
  '22', '$',
  'The practicality of the classic Swedish goggle with added greater comfort ' \
  '(rubber coating) and enhanced vision (exclusive split lenses).')
swimming_goggles << Item.new(
  'Arena',
  'Cobra Ultra Mirror Racing Goggles',
  '32', '£',
  'The Cobra Ultra Mirror is the newest member of the Arena family.  With ' \
  'low profile mirror lenses, high-tech moulding and a blade shape, Cobra ' \
  'Ultra Mirror minimizes drag and improves glide in sleek, watertight design')
swimming_goggles << Item.new(
  'Arena',
  'Cruiser Goggles',
  '11', '£',
  'Arena Cruiser goggles have easy strap adjustment and a unibody frame.')

by_item = swimming_goggles.iterator :item # iterates through single items
by_page = swimming_goggles.iterator :page # iterates through pages of items

[by_item, by_page].each do |iterate|
  puts iterate.class.name
  puts iterate.current # shows the current position of item iterator
  puts iterate.next # shows next position of iterator
  puts iterate.next # shows next position of iterator
  puts iterate.previous # shows previous position of iterator
  puts iterate.previous # shows previous position of iterator
  puts iterate.first # shows the first position
  puts iterate.previous? # shows if there are previous positions
  puts iterate.last # shows the last position
  puts iterate.next? # shows if there are next positions
end
