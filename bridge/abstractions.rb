# ABSTRACTION
require './implementors'
require 'date'

class Entity
  attr_reader :type, :move_type
  attr_accessor :room

  def initialize(room = Room.new)
    @room = room
  end

  def find_objects
    puts "Objects inside the room: #{room.objects}"
  end

  private :room
end

# REFINED ABSTRACTIONS
class Robot < Entity
  attr_reader :model

  def initialize(room, model)
    super room
    @model = model
    @move_type = :drive_in
    puts terminal_add("RESEARCH ROBOT, MODEL #{model.upcase} IS READY TO WORK")
  end

  def action
    puts terminal_add(
      "SECTOR: #{room.label.upcase}, PURPOSE: #{room.type.upcase}"
    )
    analyze
    find_objects
    puts terminal_add(room.move_in(move_type).upcase)
    hibernate! 6
  end

  def find_objects
    puts terminal_add("IDENTIFIED OBJECTS: #{room.objects.upcase}")
  end

  private

  def analyze
    puts terminal_add(room.analyze.upcase)
  end

  def hibernate!(seconds)
    puts terminal_add("GOING TO HIBERNATE MY SYSTEMS IN #{seconds} SECONDS")
    sleep seconds
    puts terminal_add('HIBERNATION...')
  end

  def terminal_add(text)
    "#{DateTime.now} -- #{text.upcase}"
  end
end

class PlayfulKid < Entity
  attr_reader :first_name, :height

  def initialize(room, f_name, height = 135)
    super room
    @first_name = f_name
    @height = height
    @move_type = :jumping
  end

  def action
    puts "Hi! I'm #{first_name}, the playful kid! My height is #{height}cm!"
    puts room.move_in move_type
    puts analyze
    puts play
  end

  def find_objects
    puts 'There are a lot of things to play with!'
  end

  private

  def analyze
    if rand(1..2) == 1
      'I see castles, lava and dragons!'
    else
      'I see knights, kings and queens!'
    end
  end

  def play
    'I\'ve already started playing'
  end
end

class CarefulMan < Entity
  attr_reader :full_name

  def initialize(room, full_name)
    super room
    @move_type = :slow_steps
    @full_name = full_name
  end

  def action
    introduce
    analyze
    step_in
    analyze
    find_objects
  end

  private

  def analyze
    puts "What do I see? I see #{room.analyze}"
  end

  def step_in
    puts "I'm starting #{room.move_in(move_type)}"
  end

  def introduce
    puts "My name is Mr.#{full_name} and I shall not do anything, until I " \
    'shall be sure what I see. So...'
  end
end
