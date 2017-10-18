# The customshop factory of guitars can make the custrom instrument for user
# (the type of instrument and model name must be specified in terminal).
# 
# FACTORY GuitarFactory
# PRODUCTS Guitar: ClassicGuitar, AcousticGuitar, ElectricGuitar, BassGuitar

require './factory'

def order
  puts <<~TEXT
    We are welcome you in our guitar customshop factory!
    We can sell you the several types of our wellmade products, please, choose the one you are interested in:
    - Our fine dreadnought acoustic guitars (type 'A6' for 6 strings; 'A12' for 12 strings)
    - Our classic acoustic guitars (type 'CS')
    - Our amazing electric guitars (type 'E6' for 6 strings; 'E7' for 7 strings)
    - Our great sounding bass guitars (type 'B4' for 4 strings; 'B5' for 5 strings)
    Please, make your decision and we'll show you more detailed information:
  TEXT
  guitar = GuitarFactory.build(gets)
  guitar.show_info
  guitar.play
  puts 'Wish to add more guitars to your order (yes/no)?'
  order if gets.include? 'y'
end

order