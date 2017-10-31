# CONCRETE FLYWEIGHT
class Ant
  @@quantity = 0

  attr_reader :binomial_name, :codename

  def initialize codename, *args
    @@quantity += 1
    @codename = codename
    find_by_code
    read_genome
  end

  def to_s size = '', behaviour = ''
    <<~ANALYSIS
      Binomial name: #{binomial_name}
      Codename: #{codename}
      Size: #{size}
      Behaviour: #{behaviour}
      Genome sequence: #{genome}
      #{'-' * 60}
    ANALYSIS
  end

  def genome
    @genome.slice(0, 40) + '...'
  end

  def self.count
    @@quantity
  end

  private

  def find_by_code
    case @codename 
    when :red
      @binomial_name = 'Acromyrmex echinatior'
      @genome_file = './genomes/acromyrmex'
    when :brown
      @binomial_name = 'Atta cephalotes'
      @genome_file = './genomes/atta'
    when :yellow
      @binomial_name = 'Cardiocondyla obscurior'
      @genome_file = './genomes/cardiocondyla'
    else
      @binomial_name = 'Camponotus floridanus'
      @genome_file = './genomes/camponotus'
    end
  end

  def read_genome
    @genome = File.open(@genome_file, 'r'){|f| f.read} || false
  end
end