# ABSTRACT CONTEXT
require './strategies'

class Man
  attr_writer :name

  def initialize(name)
    @ability = ReadingAbility.new
    self.name = name
  end

  def what_is_your_name
    p 'My name is ' + @name
  end

  def please_read
    @ability.read!
  end

  def reading_ability
    @ability.reading_ability
  end

  def change_ability(action)
    @ability = action if action.is_a? ReadingAbility
  end
end

# CONCRETE CONTEXTS
class Child < Man
  def initialize(name)
    super(name)
    @ability = CantRead.new
  end
end

class BlindMan < Man
  def initialize(name)
    super(name)
    @ability = CantEverRead.new
  end

  def see_the_light!
    change_ability LearnRead.new
    please_read
  end
end

class Grown < Man
  def initialize(name)
    super(name)
    @ability = CanRead.new
  end
end
