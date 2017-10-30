# ABSTRACT COMPONENT
class MovieComponent
  attr_reader :title, :description

  def initialize title, description = ''
    @title = title
    @description = description
  end

  def show_info
    raise NotImplementedError, 'Please, redeclare this method in a child class, don\'t use the abstract method!'
  end
end