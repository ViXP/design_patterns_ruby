# ABSTRACT COMMANDS
require './receivers'

class DrawerCommand
  attr_reader :receiver

  def initialize(receiver = Drawer)
    @receiver = receiver
  end

  def execute
    raise(
      NotImplementedError,
      'Redeclare this method in a child class, don\'t use the abstract method!'
    )
  end

  def undo
    raise(
      NotImplementedError,
      'Redeclare this method in a child class, don\'t use the abstract method!'
    )
  end
end

# CONCRETE COMMANDS
class SymbolDrawerCommand < DrawerCommand
  def execute
    receiver.print_symbol
  end

  def undo
    receiver.undo_print_symbol
  end
end

class SpaceDrawerCommand < DrawerCommand
  def execute
    receiver.print_space
  end

  def undo
    receiver.undo_print_symbol
  end
end

class BreakLineDrawerCommand < DrawerCommand
  def execute
    receiver.print_break_line
  end

  def undo
    receiver.undo_break_line
  end
end
