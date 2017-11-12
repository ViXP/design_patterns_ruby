# CONCRETE CONTEXT
require './states'

class LaboratoryWorker
  attr_reader :level1, :level2, :level3
  attr_accessor :job, :earned_money

  def initialize(full_name, initial_level = WorkerLevel.new(self))
    @full_name = full_name
    @level1 = WorkerLevel.new(self)
    @level2 = EngineerLevel.new(self)
    @level3 = ScientistLevel.new(self)
    @state = initial_level.is_a?(AuthorizationLevel) ? initial_level : @level1
    @state.job =
    @earned_money = 0
  end

  def introduce
    puts 'My name is ' + @full_name
    puts 'My job is ' + @job.to_s
  end

  def current_level
    puts 'Your current level of trust is: ' + @state.class.name
    @state
  end

  def current_level=(level)
    @state = level.is_a?(AuthorizationLevel) ? level : @state
  end

  def total_earned
    puts "You`ve earned #{earned_money}$ in total"
  end

  # Delegate the work of methods to the current state
  %i[increase_level decrease_level show_salary get_to_sector \
     fix_communication_error interact_with_matter analyze_costs].each do |mth|
    define_method(mth) do |*args|
      @state.send(mth, *args)
    end
  end
end
