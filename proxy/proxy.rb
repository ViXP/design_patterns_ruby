# CONCRETE PROXY
require './subject'

class InvestorsRegisterProxy < AbstractInvestorsRegister
  def initialize(*args)
    super(*args)
    @subject = false
  end

  def show_register
    return @subject.show_register if @subject
    stringify_info({ full_name: full_name, company: company, amount: amount }) +
    "\e[32mTHE ORIGINAL REGISTER WILL BE ACCESSIBLE AFTER THE INVESTING\e[0m"
  end

  def invest!
    return puts 'Already invested, thank you!' if @subject
    puts "Are you really wish to invest #{amount}$?"
    return false unless gets.include? 'y'
    puts 'SAVING...'
    @subject = InvestorsRegister.new(full_name, company, amount)
    @subject.invest!
    puts 'DATA IS SAVED!'
    @subject
  end
end
