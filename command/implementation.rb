# Simple pseudographical editor which can execute commands
# specified by user input, undo them and redo them.
# 
# RECEIVERS Drawer: TopLeftCornerDrawer, TopRightCornerDrawer, BottomLeftCornerDrawer, BottomRightCornerDrawer, HorizontalLineDrawer, VerticalLineDrawer, SolidFillDrawer, SpotFillDrawer
# COMMANDS DrawerCommand: SymbolDrawerCommand, SpaceDrawerCommand, BreakLineDrawerCommand
# INVOKER CommandInvoker

require 'io/console'
require './invoker'
require './receivers'

system('clear') # clears screen for a proper view
$OUTPUT = '' # global terminal output object (helps implement break line undoying)

def puts arg # declares the puts method in current context to log to output object
  super arg
  $OUTPUT += arg.to_s
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

while sym = STDIN.getch # command will be invoked depending on the user input
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
    system('clear')
    exit
  end
end