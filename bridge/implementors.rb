# ABSTRACT IMPLEMENTOR
class Room
  attr_reader :label, :area, :type

  def initialize(label, area)
    @label = label
    @area = area
    @type = self.class.name
    @objects = []
  end

  def analyze
    raise(
      NotImplementedError, \
      'Redeclare this method in a child class, don\'t use the abstract method!'
    )
  end

  def objects
    string = ''
    @objects.each {|obj| string += obj.to_s + ', '}
    string
  end

  def move_in(m_type)
    "Moving-in forward to the room by #{m_type}"
  end
end

# CONCRETE IMPLEMENTORS
class BedRoom < Room
  def initialize(*args)
    super(*args)
    @type = 'Bed room for sleeping and relaxing'
    @objects = %i[lamp sofa TV bed chairs commode]
  end

  def analyze
    if @area > 20
      "The comfortable and cozy room, area size is #{area} square meters"
    else
      'Small and uncomfortable room'
    end
  end

  def move_in(m_type)
    "Quietly moving-in forward to the room by #{m_type}"
  end
end

class BathRoom < Room
  def initialize(*args)
    super(*args)
    @objects = %i[bath soap towels shampoo shelves mirror dispenser]
  end

  def analyze
    "The bathroom with colorful tiles on the walls (the area size is #{area} " \
    'square meters)'
  end

  def move_in(m_type)
    "Carefully moving-in forward to the room with slippery floor by #{m_type}"
  end
end

class DiningRoom < Room
  def initialize(*args)
    super(*args)
    @objects = %i[table dishwasher refrigerator chairs kettle blender]
  end

  def analyze
    "The full kitchen area is #{area} square meters, #{(area / 3).ceil} men " \
    'can eat here'
  end
end
