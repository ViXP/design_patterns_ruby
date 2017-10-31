# CONCRETE ADAPTEE
require 'json'

class GEOLocatorRemoteAPI
  FILE_NM = 'remote_coordinates.json' # file name to store all coordinates

  def self.coords
    string = ''
    @coords.each do |coord|
      string += wrt_coords(coord)
    end
    string
  end

  # Returns random location coordinates
  def self.rnd_coord
    wrt_coords(@coords.sample)
  end

  # Appends new location coordinates
  def self.appnd_ncoord lat, long
    sv_coords({'lat' => lat, 'long' => long})
  end

  def self.reload!
    ld_coords
  end

  private 

  # Appends new coordinate to JSON file & to coords array
  def self.sv_coords coords
    @coords << coords
    File.open(FILE_NM, 'w+') do |f|
      f.write(@coords.to_json)
    end
  end

  def self.ld_coords
    @coords = JSON.load(File.open(FILE_NM, 'r')) || [] # getting all existing coordinates
  end

  def self.wrt_coords coord
    "Latitude: #{coord['lat']}, Longitude: #{coord['long']};\n" # human readable form of coordinates
  end

  ld_coords

  private_methods :new
end