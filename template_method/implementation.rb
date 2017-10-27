# The publisher can create three types of book,
# user specifies which kind of book he wants to create and
# uses the template method for it.
# 
# CLASSES BookConstructor: CheapBookConstructor, StandardBookConstructor, ExpensiveBookConstructor

require './classes'

puts "\e[31mStandard book creating\e[0m"
book1 = StandardBookConstructor.new('Portrait of Dorian Gray')
book1.assemble

puts "\e[31mExpensive book creating\e[0m"
book2 = ExpensiveBookConstructor.new('Divine Comedy')
book2.assemble

puts "\e[31mCheap book creating\e[0m"
book3 = CheapBookConstructor.new('The Girl with the Dragon Tattoo')
book3.assemble