# CONCRETE COMPONENT
class MarketingCampaignPhase
  attr_accessor :title, :goal
  attr_reader :planned_costs, :actual_costs

  def initialize args = {}
    set_properties args
  end

  def complete! actual_costs = false
    @complete = true
    @actual_costs = actual_costs if actual_costs && actual_costs.is_a?(Numeric)
  end

  def completed?
    !!@complete
  end

  def to_s
    "#{self.title}\t#{self.planned_costs}\t#{self.actual_costs}\t#{self.goal}\t#{self.completed?}"
  end

  def merge new_args = {}
    set_properties new_args
    self
  end

  private 

  def set_properties args = {}
    @title = args[:title] || @title || ''
    @planned_costs = args[:planned_costs] || @planned_costs || 0
    @actual_costs = args[:actual_costs] || @actual_costs || @planned_costs
    @goal = args[:goal] || @goal || ''
    @complete = args[:complete] || @complete || false
  end
end