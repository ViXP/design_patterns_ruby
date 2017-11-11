# Simple pseudographical editor which can execute commands specified by user
# input, undo them and redo them.
#
# RECEIVERS Drawer: TopLeftCornerDrawer, TopRightCornerDrawer,
#           BottomLeftCornerDrawer, BottomRightCornerDrawer, SpotFillDrawer,
#           HorizontalLineDrawer, VerticalLineDrawer, SolidFillDrawer
# COMMANDS DrawerCommand: SymbolDrawerCommand, SpaceDrawerCommand,
#          BreakLineDrawerCommand
# INVOKER CommandInvoker

# Singleton terminal output object (helps implement break line undoying):
class Stream
  @output = ''

  class << self
    attr_accessor :output
  end

  def self.clear
    system('clear')
  end

  private_methods :new
end

require 'io/console'
require './invoker'
require './receivers'

Stream.clear # clears screen for a proper view

# Declares the puts method in current context to log to output object:
def puts(arg)
  super arg
  Stream.output += arg.to_s
end

puts <<~TEXT # instructions to operate the commands
  --------------------------
  Pseudographic Ruby Drawer
  --------------------------
  list of possible commands:
  q - ╔
  w - ═
  e - ╗
  a - ║2
  s - ▓
  d - ░
  z - ╚
  x - ═
  c - ╝
  u - undo operation
  r - redo operation
  space,
  enter,
  return,
  esc - as usual
  --------------------------\n
TEXT

while (sym = STDIN.getch) # command will be invoked depending on the user input
  case sym
  when 'u', "\u007F"
    CommandInvoker.undo
  when 'r'
    CommandInvoker.redo
  when 'q'
    CommandInvoker.invoke(SymbolDrawerCommand.new(TopLeftCornerDrawer))
  when 'w', 'x'
    CommandInvoker.invoke(SymbolDrawerCommand.new(HorizontalLineDrawer))
  when 'e'
    CommandInvoker.invoke(SymbolDrawerCommand.new(TopRightCornerDrawer))
  when 'a'
    CommandInvoker.invoke(SymbolDrawerCommand.new(VerticalLineDrawer))
  when 's'
    CommandInvoker.invoke(SymbolDrawerCommand.new(SolidFillDrawer))
  when 'd'
    CommandInvoker.invoke(SymbolDrawerCommand.new(SpotFillDrawer))
  when 'z'
    CommandInvoker.invoke(SymbolDrawerCommand.new(BottomLeftCornerDrawer))
  when 'c'
    CommandInvoker.invoke(SymbolDrawerCommand.new(BottomRightCornerDrawer))
  when ' '
    CommandInvoker.invoke(SpaceDrawerCommand.new)
  when "\r"
    CommandInvoker.invoke(BreakLineDrawerCommand.new)
  when "\e"
    Stream.clear
    exit
  end
end
