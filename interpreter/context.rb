require 'singleton'

# CONCRETE CONTEXT
class Context
  include Singleton

  @current_data = ''
  @current_type = :eng
  
  def self.current_type= type
    @current_type = type if type.is_a?(Symbol)
  end

  def self.current_data= data
    @current_data = data if data.is_a?(String)
  end

  class << self
    attr_reader :current_data, :current_type
  end
end