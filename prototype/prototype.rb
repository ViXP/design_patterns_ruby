# CONCRETE PROTOTYPE
require './product'

class MarketingCampaignPlanPrototype
  @subject = MarketingCampaignPlan.new

  define_singleton_method :'=~' do |new_proto|
    @subject = new_proto if new_proto.is_a?(MarketingCampaignPlan)
  end

  def self.new
    @subject.clone
  end
end
