# ABSTRACT PRODUCT
class Guitar
  @@models = {}

  attr_reader :strings, :frets, :model

  def initialize(num_strings = false)
    @name = ''
    @model = ''
    @strings = num_strings
    @string_types = []
    @amp = false
    @frets = 0
    @pickups = false
    @woods = { top: '', body: '', fretboard: '', neck: '' }
    set_model
  end

  def amplification_required?
    @amp
  end

  def string_types
    @string_types.join ', '
  end

  def woods
    woods = ''
    @woods.each do |component, name|
      woods << "\n#{component.to_s.upcase}: #{name}"
    end
    woods
  end

  def name
    "#{@name} (#{model})"
  end

  def set_model
    puts 'Please, type your own model designation (2-3 letters): '
    @model = gets.slice(0, 3).tr("\n", '').upcase
    @model = @model.length > 1 ? @model : 'GT'
    @@models[@model] = @@models[@model] ? @@models[@model] + 1 : 1
    @model += "-#{@@models[@model]}"
  end

  def pickups
    return 'none' unless @pickups
    @pickups.respond_to?(:each) ? @pickups.join(', ') : @pickups
  end

  def show_info
    print <<~INFO
      ------------------------------
      #{name}
      ------------------------------
      Number of strings: #{strings}
      Types of strings supported: #{string_types}
      Number of frets: #{frets}
      Information about the wood of this instrument: #{woods}
      Pickups: #{pickups}
      #{if amplification_required?
          print 'This product can\'t be properly used without external '\
          'amplification!'
      end}
    INFO
  end

  def play
    raise(
      NotImplementedError,
      'Redeclare this method in a child class, don\'t use the abstract method!'
    )
  end
end

# CONCRETE PRODUCTS
class ClassicGuitar < Guitar
  def initialize(num_strings = 6)
    super
    @name = 'Classic acoustic guitar'
    @strings = num_strings
    @string_types = %i[nylon gut]
    @frets = 19
    @woods = {
      top: 'Cedar', body: 'Mahogany',
      fretboard: 'Rosewood', neck: 'Mahogany'
    }
  end

  def play
    puts 'La-da-di-da-dam...'
  end
end

class AcousticGuitar < Guitar
  def initialize(num_strings = 6)
    super
    @name = 'Dreadnought acoustic guitar'
    @strings = num_strings
    @string_types = %w[silk_&_steel bronze phosphor/bronze coated]
    @frets = 22
    @pickups = 'single piezo custom pickup with active preamp'
    @woods = {
      top: 'Spruce', body: 'Mahogany',
      fretboard: 'Ebony', neck: 'Maple'
    }
  end

  def play
    puts 'Zink! Zink! Ta-la-la-la! Zink! Zink!'
  end
end

class ElectricGuitar < Guitar
  def initialize(num_strings = 6)
    super
    @name = 'SG-style electric guitar'
    @strings = num_strings
    @string_types = %i[steel nickel-plated nickel coated]
    @amp = false
    @frets = 24
    @pickups = ['EMG-81 ceramic magnets pickup', 'EMG-89 AlNiCo magnets pickup']
    @amp = true
    @woods = { top: 'Ebony', body: 'Mahogany',
      fretboard: 'Ebony', neck: 'Nahogany' }
  end

  def play
    if strings > 6
      puts 'D-jent, d-jent! D-d-d-jent, d-jent!'
    else
      puts 'Pow-ow! Wah-wah-wah, waaaah... Dj, dj. dj!'
    end
  end
end

class BassGuitar < Guitar
  def initialize(num_strings = 4)
    super
    @name = 'Electric bass guitar'
    @strings = num_strings
    @string_types = %i[steel nickel-plated nickel coated]
    @frets = 22
    @pickups = '2 custom-made singlecoil pickups'
    @amp = true
    @woods = { body: 'Walnut', neck: 'Maple', fretboard: 'Maple' }
  end

  def play
    puts 'Pop... Pop, pop. Slap! Slap! Slap!'
  end
end
