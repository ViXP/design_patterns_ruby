# CONCRETE INVOKER
require './commands'

class CommandInvoker
  @@history = {
    undo: [],
    redo: []
  }

  def self.invoke command = DrawerCommand.new
    command.execute
    @@history[:undo] << command
  end

  def self.undo
    command = @@history[:undo].pop
    return false unless command
    command.undo
    @@history[:redo] << command
  end

  def self.redo
    command = @@history[:redo].pop
    return false unless command
    invoke command
  end
end