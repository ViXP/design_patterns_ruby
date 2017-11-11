# AOG - Artificial Organisms Generator is the machine of the future which can
# automatically construct the whole living organisms based on principles of
# artificial gene synthesis, protein engineering and other bioengineering
# technologies.
# This machine can create the new organism by passing the genome sequence (cut
# to 2 Mb from original) and name of species to it. In the following example
# scientist can create specific type of ant, by passing the codename, size and
# behaviour to AntFactory or Ant (MUCH slower) constructors.
#
# FLYWEIGHT Ant
# FACTORY AntFactory

require './factory'
require 'date'

time = Time.now
5000.times do
  codename = %i[red yellow brown black].sample # intrinsic data
  size = rand(1.0..2.0).round(1) # extrinsic data
  behaviour = %i[neutral agressive passive].sample
  # Uncomment next to find out how it will work without factory ;)
  # ant = Ant.new(codename)
  ant = AntFactory.new(codename, size, behaviour)
  # Factory will return the hash with flyweight object and extrinsic data.
  # This hash has singleton method .show_info which callbacks the flyweight
  # object's .show_info method and passes the extrinsic data. It also responds
  # to undefined methods with methods of flyweight, so this hash acts like the
  # flyweight object itself (metaprogramming in this example).
  puts ant
end
new_time = Time.now
puts "Time of work: #{new_time - time}s"
puts "Ant class instance quantity: #{Ant.count}"
