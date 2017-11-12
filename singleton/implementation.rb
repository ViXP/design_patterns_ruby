# Every new subscriber of a phone company services is added to the big phone
# book, which can be closed for further modifications when it is needed.
#
# SINGLETON PhoneBook
# CLIENT Subscriber

require './client'

# Defining the first two subscribers:
Subscriber.new('Ben Mears', '5551509')
Subscriber.new('Mark Petrie', '5550202')
Subscriber.new # asking user to enter the data for new subscriber

puts PhoneBook.show_book # showing the catalogue of subscribers data
PhoneBook.close_book! # closing the phone book for further modifications

# Will raise an error, because the singleton and its instance properties are
# closed for further modifications:
Subscriber.new('Susan Norton', '5551324')
