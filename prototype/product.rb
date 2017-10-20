# CONCRETE PRODUCT
require './component'

class MarketingCampaignPlan
  attr_accessor :phases, :title

  def initialize title = ''
    @title = title
    @phases = []
  end

  def << new_phase
    @phases << new_phase if new_phase.is_a?(MarketingCampaignPhase) && !self.phases.include?(new_phase)
  end

  def >> phase_num
    @phases.delete_at(phase_num - 1) if (phase_num - 1) < self.phases.size
  end

  def planned_costs
    costs = 0
    self.phases.each{|phase| costs += phase.planned_costs}
    costs
  end

  def actual_costs
    costs = 0
    self.phases.each{|phase| costs += phase.actual_costs}
    costs
  end

  def to_s
    string = "Marketing campaign plan for #{self.title}\n\#\tPhase title:\tPlanned costs:\tActual costs:\tGoal:\tCompleted:\n"
    self.phases.each_with_index {|phase, num| string += "#{num+1}\t#{phase}\n" }
    string += "Overall planned costs: #{self.planned_costs}\tOverall actual costs: #{self.actual_costs}"
  end

  def []= stage = 0, data = false
    return false if !data || !data.is_a?(Hash) || ((stage - 1) > self.phases.size)
    @phases[stage-1] = @phases[stage-1].merge(data)
  end 

  def clone
    new_campaign = super
    new_campaign.phases = self.phases.map(&:clone)
    new_campaign
  end

  protected :phases=
end