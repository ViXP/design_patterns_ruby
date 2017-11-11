# CONCRETE FLYWEIGHT
class Ant
  @quantity = 0

  class << self
    attr_accessor :quantity

    alias count quantity
  end

  attr_reader :binomial_name, :codename

  def initialize(codename)
    self.class.quantity += 1
    @codename = codename
    find_by_code
    read_genome
  end

  def to_s(size = '', behaviour = '')
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

  private

  def find_by_code
    @binomial_name, @genome_file =
      case @codename
      when :red then ['Acromyrmex echinatior', './genomes/acromyrmex']
      when :brown then ['Atta cephalotes', './genomes/atta']
      when :yellow then ['Cardiocondyla obscurior', './genomes/cardiocondyla']
      else ['Camponotus floridanus', './genomes/camponotus']
      end
  end

  def read_genome
    @genome = File.open(@genome_file, 'r'){|f| f.read} || false
  end
end
