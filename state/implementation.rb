# The new worker of laboratory can have one of the three
# levels of access, which depends on his job. Each level
# allows performing сertain actions and denies other. Every
# hardworking worker can increase his level of trust (and vice versa).
# 
# CONTEXT LaboratoryWorker
# STATES AuthorizationLevel: WorkerLevel, EngineerLevel, ScientistLevel

require './context'

john = LaboratoryWorker.new('John Linden') # creating the context
3.times do # the state of context will change, so do the methods implementation
  puts '-' * 60
  john.introduce
  john.get_to_sector 1 # will properly work with each state
  john.get_to_sector 2 # will work with second, third states
  john.get_to_sector 3 # will work with third state
  john.analyze_costs # will work with first state
  john.fix_communication_error # will work with second, third states
  john.interact_with_matter # will work with third state
  john.get_salary # common methods
  john.total_earned
  john.increase_level # state changes to next one
end
john.decrease_level # state changes to previous
