# ABSTRACT STRATEGY
class ReadingAbility
  def reading_ability
    puts 'Reading ability: ' + self.class.name
  end

  def read!
    raise(
      NotImplementedError,
      'Redeclare this method in child class, don`t use the abstract method!'
    )
  end
end

# CONCRETE STRATEGIES
class CantRead < ReadingAbility
  def read!
    puts 'Sorry, I can\'t read :('
  end
end

class CantEverRead < ReadingAbility
  def read!
    puts 'I will never read anymore... :('
  end
end

class CanRead < ReadingAbility
  def read!
    puts 'I am reading'
  end
end

class LearnRead < ReadingAbility
  def read!
    puts 'Hooray! I\'ve learned how to read, and now I\'m reading!'
  end
end
