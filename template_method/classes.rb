# ABSTRACT CLASS
class BookConstructor
  attr_reader :title, :leaf_material, :front_cover, :cover_material

  def initialize(title)
    @title = title
    @front_cover = ''
    @cover_material = ''
    @leaf_material = ''
    @decorations = []
  end

  def assemble
    print_cover
    cut_boards if multilayer_cover?
    glue_cover_layers if multilayer_cover?
    print_signatures
    cut_and_sew_signatures
    glue_signatures
    glue_all
    assemble_endpapers if endpapers?
    decorate if decorations?
    puts "\e[32mDONE!\e[0m"
  end

  def print_cover
    puts "Printing cover on #{front_cover} (title: #{title})"
  end

  def cut_boards
    puts "Cutting the #{cover_material} for boards and joint"
  end

  def glue_cover_layers
    puts 'Glueing the cases with boards and joint'
  end

  def print_signatures
    puts "Printing the book leafs on a #{leaf_material}"
  end

  def cut_and_sew_signatures
    puts 'Cutting and sewing the signatures'
  end

  def glue_signatures
    puts 'Glueing signatures with crash, liner and headbangs'
  end

  def glue_all
    puts 'Glueing the components of cover with other already glued components'
  end

  def assemble_endpapers
    puts 'Cutting and glueing the endpapers to the book'
  end

  def decorate
    str = ''
    @decorations.each {|deco| str << "#{deco}; "}
    puts "Assembling the decorations: #{str}"
  end

  private

  # Hooks
  %i[multilayer_cover? endpapers? decorations?].each do |mth|
    define_method(mth) { true }
  end
end

# CONCRETE CLASSES
class CheapBookConstructor < BookConstructor
  def initialize(title)
    super title
    @front_cover = 'glance paper'
    @leaf_material = 'thin offset paper'
  end

  private

  def multilayer_cover?
    false
  end

  def decorations?
    false
  end

  def endpapers?
    false
  end
end

class StandardBookConstructor < BookConstructor
  def initialize(title)
    super title
    @cover_material = 'carton'
    @leaf_material = 'offset paper'
  end

  private

  def decorations?
    false
  end
end

class ExpensiveBookConstructor < BookConstructor
  def initialize(title)
    super title
    @front_cover = :leather
    @cover_material = :wood
    @leaf_material = 'coated paper'
    @decorations = ['raised bands', 'gold corners', 'metal title', 'steel lock']
  end

  def print_cover
    puts "Stamping the cover illustration on #{front_cover} (title: #{title})"
  end
end
