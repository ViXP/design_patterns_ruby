# ABSTRACT COMPONENT
class SkateComponent
  attr_reader :title

  def show_info
    raise(
      NotImplementedError,
      'Redeclare this method in a child class, don\'t use the abstract method!'
    )
  end
end

# CONCRETE COMPONENTS
class Deck < SkateComponent
  attr_reader :wood, :layers

  def initialize(title, wood = :maple, layers = 7)
    @title = title
    @wood = wood
    @layers = layers
  end

  def show_info
    <<~INFO
      -----------
      Title: #{title}
      Wood: #{wood}
      Number of layers: #{layers}
    INFO
  end
end

class Truck < SkateComponent
  attr_reader :size, :colors

  def initialize(title, size, colors = [])
    @title = title
    @size = size
    @colors = colors
  end

  def colors
    string = ''
    @colors.each {|color| string += "#{color}/" }
    string.chomp('/')
  end

  def show_info
    <<~INFO
      -----------
      Title: #{title}
      Size: #{size}cm
      Colors: #{colors}
    INFO
  end
end

class Bearing < SkateComponent
  attr_reader :abec, :colors

  def initialize(title, abec, colors = [])
    @title = title
    @abec = abec
    @colors = colors
  end

  def colors
    string = ''
    @colors.each {|color| string += "#{color}/" }
    string.chomp('/')
  end

  def show_info
    <<~INFO
      -----------
      Title: #{title}
      ABEC: #{abec}
      Colors: #{colors}
    INFO
  end
end

class Wheel < SkateComponent
  attr_reader :diameter, :density, :image_type

  def initialize(title, diameter, density, image_type)
    @title = title
    @diameter = diameter
    @density = density
    @image_type = image_type
  end

  def show_info
    <<~INFO
      -----------
      Title: #{title}
      Diameter: #{diameter}mm
      Density: #{density}A
      Image: #{image_type}
    INFO
  end
end

class GripTape < SkateComponent
  attr_reader :image_type

  def initialize(title, image_type)
    @title = title
    @image_type = image_type
  end

  def show_info
    <<~INFO
      -----------
      Title: #{title}
      Image: #{image_type}
    INFO
  end
end
