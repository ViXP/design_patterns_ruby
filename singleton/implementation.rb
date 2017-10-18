# Every new subscriber of a phone company services is added to the big
# phone book, which can be closed for further modifications when it is needed
# 
# SINGLETON PhoneBook
# CLIENT Subscriber

require './client'

subscriber1 = Subscriber.new('Ben Mears', '5551509') # defines the first two subscribers 
subscriber2 = Subscriber.new('Mark Petrie', '5550202')
subscriber3 = Subscriber.new # asks user to enter the data for new subscriber

puts PhoneBook.show_book # shows the catalogue of subscribers data
PhoneBook.close_book! # closes phone book for further modifications

subscriber4 = Subscriber.new('Susan Norton', '5551324') # will raise an error, because the singleton and its instance properties are closed for further modifications