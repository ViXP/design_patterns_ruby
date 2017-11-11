# CONCRETE COMPONENT
require 'date'

class TextMessage
  attr_reader :invokers, :radiation_level, :text_message, :importance_level

  def initialize(text_message = 'Everything is normal.')
    @importance_level = 4
    @radiation_level = :standard
    @time = DateTime.now
    @invokers = [:duty_alert_system]
    @text_message = text_message
  end

  def time
    @time.strftime('%T')
  end
end
