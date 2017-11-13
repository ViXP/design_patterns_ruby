# CONCRETE PRODUCT
require './component'

class MarketingCampaignPlan
  attr_accessor :phases, :title

  def initialize(title = '')
    @title = title
    @phases = []
  end

  def <<(new_phase)
    @phases << new_phase if new_phase.is_a?(MarketingCampaignPhase) && \
      !phases.include?(new_phase)
  end

  def >>(other)
    @phases.delete_at(other - 1) if (other - 1) < phases.size
  end

  def planned_costs
    costs = 0
    phases.each{|phase| costs += phase.planned_costs}
    costs
  end

  def actual_costs
    costs = 0
    phases.each{|phase| costs += phase.actual_costs}
    costs
  end

  def to_s
    string = "Marketing campaign plan for #{title}\n\#\tPhase title:\t" \
      "Planned costs:\tActual costs:\tGoal:\tCompleted:\n"
    phases.each_with_index {|phase, num| string << "#{num + 1}\t#{phase}\n"}
    string << "Overall planned costs: #{planned_costs}\tOverall actual " \
      "costs: #{actual_costs}"
  end

  def []=(stage = 0, data = false)
    return false if !data || !data.is_a?(Hash) || ((stage - 1) > phases.size)
    @phases[stage - 1] = @phases[stage - 1].merge(data)
  end

  def clone
    new_campaign = super
    new_campaign.phases = phases.map(&:clone)
    new_campaign
  end

  protected :phases=
end
