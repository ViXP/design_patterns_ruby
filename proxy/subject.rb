# ABSTRACT SUBJECT
class AbstractInvestorsRegister
  attr_reader :full_name, :company, :amount

  def initialize(full_name, company, amount)
    @full_name = full_name
    @company = company
    @amount = amount
  end

  %i[invest! show_register].each do |mth|
    define_method(mth) do |*|
      raise(
        NotImplementedError,
        'Redeclare this method in a child class, don\'t use the abstract ' \
        'method!'
      )
    end
  end

  private

  def stringify_info(investor)
    <<~TEXT
      Full investor name: #{investor[:full_name]}
      Company name: #{investor[:company]}
      Amount of money invested: #{investor[:amount]}$\n
    TEXT
  end
end

# CONCRETE SUBJECT
class InvestorsRegister < AbstractInvestorsRegister
  def initialize(*args)
    super(*args)
    @data_file = './data'
    @register = []
  end

  def invest!
    new_info = { full_name: full_name, company: company, amount: amount }
    load_data
    @register << new_info
    File.open(@data_file, 'w') {|file| file.write(Marshal.dump(@register)) }
  end

  def show_register
    full_info = ''
    load_data
    @register.each {|investor| full_info << stringify_info(investor) }
    full_info
  end

  def clear_data!
    puts 'Are you sure you wish to fully clear the register?'
    return false unless gets.include? 'y'
    File.open(@data_file, 'w') {|file| file.write('') }
    load_data
  end

  private

  def load_data
    object = File.read(@data_file)
    @register = object == '' ? [] : Marshal.load(object)
  end
end
