# ABSTRACT PRODUCTS
require './components'

class TobaccoMixture
  attr_accessor :name, :main_component

  def initialize
    @main_component = Tobacco.new
    @secondary_components = []
    @similar_products = []
  end

  def <<(component = Tobacco.new)
    @secondary_components << component
  end

  def aroma
    @main_component.aroma + \
    (@secondary_components.empty? ? '' : " with notes of #{components_aroma}")
  end

  def main_component
    component_to_string @main_component
  end

  def components
    desc = ''
    @secondary_components.each {|comp| desc << component_to_string(comp) }
    desc
  end

  def weight
    full_weight = @main_component.weight
    @secondary_components.each {|comp| full_weight << comp.weight }
    full_weight
  end

  def recipe
    puts <<~RECIPE
      #{name} (#{weight} g)
      ---------------------
      Main component: #{main_component}
      #{"Secondary components:\n#{components}" unless @secondary_components.empty?}
      Aroma: #{aroma}
      The similar products on the market:
      #{similar_products}
    RECIPE
  end

  def similar_products
    prods = ''
    @similar_products.each {|product| prods << "- #{product}\n" }
    prods
  end

  private

  def component_to_string(component = Tobacco.new)
    component.name + " -- #{component.color} color (#{component.weight} g);\n"
  end

  def components_aroma
    aroma = ''
    @secondary_components.each {|comp| aroma << comp.aroma + ' ' }
    aroma
  end
end

# CONCRETE PRODUCTS
class TobaccoPipe
  attr_reader :title, :model, :description

  def initialize(title, model, description)
    @title = title
    @model = model
    @description = description
  end

  def specifications
    puts <<~SPECS
      #{title} (#{model})
      -----------------------------
      Pipe description:
      #{description}
    SPECS
  end
end

class EnglishMixture < TobaccoMixture
  def initialize
    super
    @name = 'English mixture'
    @similar_products = [
      'Dunhill Nightcap',
      'McClelland Three Oaks Syrian',
      'Ashton Artisan\'s Blend'
    ]
  end
end

class AmericanMixture < TobaccoMixture
  def initialize
    super
    @name = 'American mixture'
    @similar_products = [
      'G. L. Pease JackKnife Plug',
      'Ilsteds Own Mixture Dark Fired Plug',
      'Cornell & Diehl Epiphany'
    ]
  end
end

class ScottishMixture < TobaccoMixture
  def initialize
    super
    @name = 'Scottish blend'
    @similar_products = [
      'Dunhill My Mixture 965',
      'Peterson Old Dublin',
      'G.L.Pease Gaslight'
    ]
  end
end

class BalkanMixture < TobaccoMixture
  def initialize
    super
    @name = 'Balkan mixture'
    @similar_products = [
      'Samuel Gawith Balkan Flake',
      'McClelland Blue Mountain',
      'Kendal Balkan Mixture'
    ]
  end
end

class DanishMixture < TobaccoMixture
  def initialize
    super
    @name = 'Danish mixture'
    @similar_products = [
      'Stanislaw Danish Blend',
      'W.O.Larsen Old Belt',
      'Alsbo Black'
    ]
  end
end

class VirginiaMixture < TobaccoMixture
  def initialize
    super
    @name = 'Bright Virginia mixture'
    @similar_products = [
      'Rattray\'s Marlin Flake',
      'Wessex Gold Virginia Flake',
      'Ilsteds Own Virginia Plug'
    ]
  end
end

class VaperMixture < TobaccoMixture
  def initialize
    super
    @name = 'Virginia/Perique mixture'
    @similar_products = [
      'G.L.Pease Fog City: Telegraph Hill',
      'Dunhill Elizabethan Mixture',
      'Hearth & Home AJ\'s Va/Per'
    ]
  end
end
