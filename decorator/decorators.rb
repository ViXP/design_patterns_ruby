# ABSTRACT DECORATOR
require './component'

class TextMessageDecorator
  attr_reader :context

  def initialize(text_message_obj)
    @context = text_message_obj
  end

  %i[text_message time].each do |mth|
    define_method mth do
      decorate(@context.send(mth))
    end
  end

  %i[importance_level invokers radiation_level].each do |mth|
    define_method mth do
      @context.send(mth)
    end

    define_method :"show_#{mth}" do
      if mth == :invokers
        data = ''
        invokers.each {|inv| data << "#{inv}; "}
      else
        data = send(mth)
      end
      decorate(decorate_recursively(@context, data))
    end

    protected :"show_#{mth}"
  end

  def show_message
    puts <<~TEXT
      ********************************
      NUCLEAR POWER PLANT ALERT SYSTEM
      ********************************
      Time of message: #{time}
      Message: #{text_message}
      Current radiation level: #{show_radiation_level}
      The level of message importance: #{show_importance_level}
      Invoked by: #{show_invokers}\n
    TEXT
  end

  private

  def decorate(value)
    value
  end

  def decorate_recursively(context, value)
    if context.respond_to?(:decorate, true)
      context.send(
        :decorate, decorate_recursively(context.send(:context), value)
      )
    else
      value
    end
  end

  private :context
end

# CONCRETE DECORATORS
class LowLevelTextMessageDecorator < TextMessageDecorator
  def importance_level
    super - 2
  end

  def radiation_level
    :low
  end

  def invokers
    super() + %i[suspicion_detection_system]
  end

  private

  def decorate(val)
    "\e[2m~~~ #{val} ~~~\e[0m"
  end
end

class NormalLevelTextMessageDecorator < TextMessageDecorator
  private

  def decorate(val)
    "\e[37m #{val} \e[0m"
  end
end

class AbnormalLevelTextMessageDecorator < TextMessageDecorator
  def importance_level
    super + 2
  end

  def radiation_level
    :abnormal
  end

  def invokers
    super() + [:warning_system]
  end

  private

  def decorate(val)
    "\e[4m\e[32m #{val} \e[0m"
  end
end

class HighLevelTextMessageDecorator < TextMessageDecorator
  def importance_level
    super + 4
  end

  def radiation_level
    :high
  end

  def invokers
    super() + [:hazard_warning_system]
  end

  private

  def decorate(val)
    "\e[1m\e[33m!!!  #{val}  !!!\e[0m"
  end
end

class CatastrophicLevelTextMessageDecorator < TextMessageDecorator
  def importance_level
    super + 6
  end

  def radiation_level
    :highest
  end

  def invokers
    super() + [:evacuation_system]
  end

  private

  def decorate(val)
    "\e[5m\e[31m☣    #{val}    ☣\e[0m"
  end
end
