# The crowd of different kind of people with different kind of reading abilities
#
# CONTEXTS Man: Child, Grown, BlindMan
# STRATEGIES ReadingAbility: CantRead, CantEverRead, LearnRead, CanRead

require './contexts'
require './strategies'

# Create new kid
kid = Child.new('Bobby')
kid.what_is_your_name
kid.please_read

# Let the kid learn how to read
kid.change_ability(LearnRead.new)
kid.please_read

# Create new blind man
blindman = BlindMan.new('Robert')
blindman.what_is_your_name
blindman.please_read

# Let the blind man see the light!
blindman.see_the_light!

# Just a regular grown man
grownman = Grown.new('John')
grownman.what_is_your_name
grownman.please_read
grownman.reading_ability
