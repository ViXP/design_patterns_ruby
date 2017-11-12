# CEO of average software development company decided to make the marketing
# campaign plan for his new GPS-navigator product. He came up with several
# ideas, and throw it for the brainstorm to two of his top manamgers. The one,
# who will come with better ideas will get his salary increase. The final
# version of plan will be revised and approved by CFO.
#
# PROTOTYPE MarketingCampaignPlanPrototype
# PRODUCT MarketingCampaignPlan
# COMPONENT MarketingCampaignPhase

require './prototype'

# The first product of 'blank' prototype:
director_campaign = MarketingCampaignPlanPrototype.new

# Setting the new data:
director_campaign.title = 'New GPS-navigator application for mobile devices'
director_campaign << MarketingCampaignPhase.new({
  title: 'TV advertisements',
  goal: 'Get potential customers informed',
  planned_costs: 1_500_000
})
director_campaign << MarketingCampaignPhase.new({
  title: 'GOOGLE context advertising',
  goal: 'Get customers from competitors',
  planned_costs: 400_000
})
director_campaign << MarketingCampaignPhase.new({
  title: 'Free lectures about the product',
  goal: 'Get more potential customers',
  planned_costs: 40_000,
  actual_costs: 28_000,
  complete: true
})

# The product becomes a new prototype:
MarketingCampaignPlanPrototype =~ director_campaign

# The second product of first product prototype
manager1_campaign = MarketingCampaignPlanPrototype.new
manager1_campaign[2] = {
  title: 'GOOGLE and Yahoo context advertising',
  planned_costs: 600_000, complete: false
} # editing the cloned property
manager1_campaign << MarketingCampaignPhase.new({
  title: 'Contracts with maps publishers to include our booklets',
  goal: 'Move people from published to electronic maps',
  planned_costs: 400_000
})
manager1_campaign << MarketingCampaignPhase.new({
  title: 'Billboards with advertisements in the richest part of town',
  goal: 'Get more potential customers',
  planned_costs: 200_000
})
manager1_campaign << MarketingCampaignPhase.new({
  title: 'Contract with the popular TV show about travels',
  goal: 'Get more buzz',
  planned_costs: 800_000
})

# The third product of first product prototype:
manager2_campaign = MarketingCampaignPlanPrototype.new
manager2_campaign << MarketingCampaignPhase.new({
  title: 'Street promoters (mobile phone costumes) in the main towns',
  goal: 'Get more people notified',
  planned_costs: 50_000
})
manager2_campaign << MarketingCampaignPhase.new({
  title: 'Advertisements in competitive applications',
  goal: 'Get customers from competitors',
  planned_costs: 150_000
})
manager2_campaign << MarketingCampaignPhase.new({
  title: 'Shortlength movie with product placement for film festivals',
  goal: 'Get more buzz',
  planned_costs: 250_000
})

# The first manager wins, so his product becomes a new prototype:
MarketingCampaignPlanPrototype =~ manager1_campaign

# The last product of second product prototype:
financialdir_campaign = MarketingCampaignPlanPrototype.new
financialdir_campaign >> 5 # remove one of the cloned properties

# Edit all cloned properties:
financialdir_campaign.phases.each {|phase| phase.complete! }

puts <<~TEXT
  CEO version of campaign plan:\n #{director_campaign}\n
  First top manager campaign plan:\n #{manager1_campaign}\n
  Second top manager campaign plan:\n#{manager2_campaign}\n
  CFO revised version of campaign plan:\n#{financialdir_campaign}\n
TEXT
