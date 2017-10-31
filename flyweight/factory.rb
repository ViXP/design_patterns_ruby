# CONCRETE FACTORY
require './flyweight'

class AntFactory
  @collection = []

  def self.new codename, size, behaviour
    hash = false
    ant = false
    @collection.each do |cur_hash|
      if (cur_hash[:codename] == codename && cur_hash[:size] == size && cur_hash[:behaviour] == behaviour)
        return hash = cur_hash # current hash is the 'new' composite object 
      else
        ant = cur_hash[:entity] if (cur_hash[:entity].codename == codename)
      end
    end

    unless hash
      hash = {codename: codename, size: size, behaviour: behaviour, entity: ant || Ant.new(codename)} 
      @collection << hash
    end 

    # Magic of metaprogramming
    hash.instance_eval do
      def to_s
        self[:entity].to_s(self[:size], self[:behaviour])
      end

      def method_missing mth, *args
        return self[:entity].send(mth, *args) if self[:entity].respond_to?(mth)
        raise NoMethodError.new
      end
    end
    hash
  end
end