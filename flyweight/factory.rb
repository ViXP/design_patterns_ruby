# CONCRETE FACTORY
require './flyweight'

class AntFactory
  @collection = []

  def self.new(codename, size, behav)
    product, entity = false
    @collection.each do |h|
      if h[:codename] == codename && h[:size] == size && h[:behaviour] == behav
        return product = h # current product is the 'new' composite object
      end
      entity = h[:entity] if h[:entity].codename == codename
    end
    product = create_new_object(codename, size, behav, entity) unless product
    product.extend FlyweightAccessible
    product
  end

  private

  def self.create_new_object(codename, size, behaviour, entity)
    product = { codename: codename, size: size, behaviour: behaviour }
    product[:entity] = entity || Ant.new(codename)
    @collection << product
    product
  end
end

# FLYWEIGHT METHODS DELEGATOR MODULE
module FlyweightAccessible
  def to_s
    self[:entity].to_s(self[:size], self[:behaviour])
  end

  def method_missing(mth, *args)
    # Delegates the running of called methods to the flyweight entity
    return self[:entity].send(mth, *args) if self[:entity].respond_to?(mth)
    super
  end

  def respond_to_missing?(*args)
    super(*args)
  end
end
