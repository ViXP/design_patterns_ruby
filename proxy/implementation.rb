# The investors register keeps the data of all investors for a new startup
# Client can initialize the new investor through the proxy object, but the real
# access to the investors register will be got only after making the investment.
#
# SUBJECT AbstractInvestorsRegister: InvestorsRegister
# PROXY AbstractInvestorsRegister: InvestorsRegisterProxy

require './proxy'

# Creating the new investor through proxy object:
new_investor = InvestorsRegisterProxy.new(
  'Mr. Reach Man', 'Very Important But Ltd.', 230_000
)
puts new_investor.show_register # will simulate the work of real register
new_investor.invest! # initializes the real subject and saves data to it
puts new_investor.show_register # now method will be delegated to the real subj
# Won't work, `cause the method implementation is hidden in a real object only:
new_investor.clear_data!

# P.S: But the spike way will work ;)
new_investor.instance_variable_get('@subject').clear_data!
