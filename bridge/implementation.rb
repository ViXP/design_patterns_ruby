# There are several rooms and several intelligent entities, that can interact
# with different rooms differently. The bridged composed objects help to move
# the entities from one room to another dynamically without huge amounts of
# aggregated classes.
# 
# ABSTRACTIONS Entity: Robot, PlayfulKid, CarefulMan
# IMPLEMENTORS Room: BedRoom, BathRoom, DiningRoom

require './abstractions'
require './implementors'

# Defining the several implementors objects
dining_room = DiningRoom.new(:B2, 15)
bathroom = BathRoom.new(:C4, 12)

# Defining the several bridged objects
kid_in_dining = PlayfulKid.new(dining_room, 'Billy', 145)
robot_in_bathroom = Robot.new(bathroom, 'T-1020')
man_in_bedroom = CarefulMan.new(BedRoom.new(:A1, 36), 'Robert Arthur Thompson-Jones')
man_in_bathroom = CarefulMan.new(bathroom, 'Robert Arthur Thompson-Jones')

# Doing the common stuff with those objects
[kid_in_dining, robot_in_bathroom, man_in_bedroom, man_in_bathroom].each do |bridged|
  puts "\n\e[31m#{bridged.class.name}\e[0m"
  bridged.action
  bridged.find_objects
end

puts "\n\e[31mDynamically changed implementor:\e[0m"
robot_in_bathroom.room = dining_room # changing the implementor of refined abstraction
robot_in_bathroom.action # implementor is not BathRoom anymore and still does the job