# CONCRETE TARGET
class LocalPlacesLocator
  def initialize
    @locations = []
  end

  def whats_interesting?
    @locations.each do |location|
      print readable location
    end
  end

  def find_interesting
    print readable(@locations.sample)
  end

  def new_finding lat, long
    @locations << {'lat' => lat, 'long' => long}
  end

  private

  def readable location
    "Latitude: #{location['lat']}, Longitude: #{location['long']};\n"
  end
end