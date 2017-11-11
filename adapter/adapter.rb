# CONCRETE ADAPTER
require './target'

class RemotePlacesLocatorAdapter < LocalPlacesLocator
  def initialize(adaptee)
    @adaptee = adaptee
  end

  def whats_interesting?
    print @adaptee.coords
  end

  def find_interesting
    print @adaptee.rnd_coord
  end

  def new_finding(lat, long)
    @adaptee.appnd_ncoord lat, long
  end
end
