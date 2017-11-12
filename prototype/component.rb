# CONCRETE COMPONENT
class MarketingCampaignPhase
  attr_accessor :title, :goal
  attr_reader :planned_costs, :actual_costs

  def initialize(args = {})
    define_properties args
  end

  def complete!(actual_costs = false)
    @complete = true
    @actual_costs = actual_costs if actual_costs && actual_costs.is_a?(Numeric)
  end

  def completed?
    @complete
  end

  def to_s
    "#{title}\t#{planned_costs}\t#{actual_costs}\t#{goal}\t#{completed?}"
  end

  def merge(new_args = {})
    define_properties new_args
    self
  end

  private

  def define_properties(args = {})
    @title = args[:title] || @title || ''
    @planned_costs = args[:planned_costs] || @planned_costs || 0
    @actual_costs = args[:actual_costs] || @actual_costs || @planned_costs
    @goal = args[:goal] || @goal || ''
    @complete = args[:complete] || @complete || false
  end
end
