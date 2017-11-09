# The program gives a writer the functionality of version control system for his work on
# the new chapters of a book. He can edit the chapter, save his work, watch the history 
# of saved states and restore the previous states if he needs to.
# 
# MEMENTO TextChunk
# CARETAKER CaretakerOriginatorInterface: ChapterCaretaker
# ORIGINATOR CaretakerOriginatorInterface: ChapterOriginator

require './caretaker'

chapter1 = ChapterCaretaker.new # initializing the new caretaker

# Editing & saving the first memento:
chapter1.set_state 'Chapter 1 - Arrival', \
'Here I shall write the text of the first chapter of my new book!'
puts chapter1.get_state # shows the current edit
chapter1.save_state

# Editing & saving the second memento:
chapter1.set_state nil, \
'Some new text of the chapter'
puts chapter1.get_state # shows the current edit
chapter1.save_state

# Editing & saving the third memento:
chapter1.set_state 'Chapter 1 - A trip', \
'Once upon a time, there was a little girl who lived in a village near the forest.'
puts chapter1.get_state # shows the current edit
chapter1.save_state

# Something goes wrong with a new edit
chapter1.set_state '~', '~'
puts chapter1.get_state # data is lost, so user must restore his work

# Shows the history of saved mementos:
puts chapter1.history

# Let user specify the version of memento he wish to rollback:
chapter1.restore gets.chomp # if nothing is specified - the caretaker will rollback to previous saved state
puts chapter1.get_state # shows the restored state
puts chapter1.history # shows the history after rollback
