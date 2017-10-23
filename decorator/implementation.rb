# The Nuclear Power Plant notification system test will show
# the different formatted information about current plant state
# by using the text message decorators
# 
# COMPONENT TextMessage
# DECORATORS TextMessageDecorator: LowLevelTextMessageDecorator, NormalLevelTextMessageDecorator, AbnormalLevelTextMessageDecorator, HighLevelTextMessageDecorator, CatastrophicLevelTextMessageDecorator

require './component'
require './decorators'

text_message = TextMessage.new('The scheduled inspection of all safety systems.
Please follow the procedures prescribed by the different levels of danger
specified in your job description') # starts from invoking the main component object

# Let's create the warning message of the lowest level:
lowest_message = LowLevelTextMessageDecorator.new(text_message)
lowest_message.show_message # will show the message of the lowest level decorator

# The warning message from normal level decorator:
normal_message = NormalLevelTextMessageDecorator.new(text_message)
normal_message.show_message # will show the message of normal level decorator

# The warning message from abnormal level decorator:
abnormal_message = AbnormalLevelTextMessageDecorator.new(text_message)
abnormal_message.show_message # will show the message of abnormal level decorator

# The warning message from high level decorator:
higher_message = HighLevelTextMessageDecorator.new(text_message)
higher_message.show_message # will show the message of high level decorator

# The warning message from catastrophic level decorator:
highest_message = CatastrophicLevelTextMessageDecorator.new(text_message)
highest_message.show_message # will show the message of high level decorator

# Decorators can be combined in this fashion:
puts 'Decorators stacking sample:'
CatastrophicLevelTextMessageDecorator.new(
  HighLevelTextMessageDecorator.new(
    TextMessage.new('Sample of russian doll'))).show_message
