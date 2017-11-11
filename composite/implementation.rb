# Video rental of different horror movies, categorized by genre and subgenre.
# Each movie can be rent dynamically from any category.
#
# COMPONENT MovieComponent
# COMPOSITE MovieCategory
# LEAF Movie

require './composite'
require './leaf'

# Composites
horror_genre = MovieCategory.new(
  'Horror Movies',
  'A horror film is a movie that seeks to elicit a physiological reaction, ' \
  'such as an elevated heartbeat, through the use of fear and shocking one’s ' \
  'audiences.'
)
slashers = MovieCategory.new(
  'Slashers',
  'Often revolves around a serial killer who systematically murders people ' \
  'through violent means.'
)
gothic = MovieCategory.new(
  'Gothic',
  'Gothic horror is a type of story that contains elements of goth and horror.'
)
zombie_films = MovieCategory.new(
  'Zombie films',
  'Zombie films feature creatures who are usually portrayed as either ' \
  'reanimated corpses or mindless human beings.'
)
supernatural = MovieCategory.new(
  'Supernatural films',
  'Includes menacing ghosts, demons, or other depictions of supernatural ' \
  'occurrences.'
)

# Leafs
cabin_in_woods = Movie.new(
  'The Cabin in the Woods', 2012,
  'American college students Dana, Holden, Marty, Jules, and Curt are ' \
  'spending their weekend at a seemingly deserted cabin in the forest, a ' \
  'cabin recently acquired by Curt\'s cousin.'
)
cabin_in_woods.rent!
predator = Movie.new(
  'Predator', 1987,
  'Dutch is sent on a mission to destroy a rebel base in Vietnam and rescue ' \
  'POWs. Once they get there he discovers his friend lied and all the POWs ' \
  'were dead but one. They take her and suddenly the marines begin getting ' \
  'killed.'
)
ringu = Movie.new(
  'Ringu', 1998,
  'A reporter and her ex-husband investigate a cursed video tape that is ' \
  'rumored to kill the viewer seven days after watching it.'
)
dracula = Movie.new(
  'Dracula', 1931,
  'The ancient vampire Count Dracula arrives in England and begins to prey ' \
  'upon the virtuous young Mina.'
)
it_follows = Movie.new(
  'It Follows', 2014,
  'A young woman is followed by an unknown supernatural force after a sexual ' \
  'encounter.'
)
cloverfield = Movie.new(
  'Cloverfield', 2008,
  'A group of friends venture deep into the streets of New York on a rescue ' \
  'mission during a rampaging monster attack.'
)

# Adding the leafs and composites to other composites:
horror_genre.add(
  [predator, cloverfield, slashers, gothic, zombie_films, supernatural]
)
slashers.add cabin_in_woods
zombie_films.add cabin_in_woods
supernatural.add [ringu, cabin_in_woods, it_follows, gothic]
gothic.add dracula
supernatural.remove cabin_in_woods # remove the already added leaf
horror_genre.show_info # shows the whole hierarchy
