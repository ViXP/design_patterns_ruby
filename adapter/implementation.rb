# User recearches the interesting places on planet Earth. He have his own local
# store for geographical coordinates, he wish to save, and also he can save it
# to the remote store through some non-mutable API with strange methods names.
# Luckly, he can use the adapter for work with remote API with the same
# interface as with local store.
#
# TARGET LocalPlacesLocator
# ADAPTER RemotePlacesLocatorAdapter
# ADAPTEE GEOLocatorRemoteAPI

require './target'
require './adaptee'
require './adapter'

local_store = LocalPlacesLocator.new # local store
remote_store = RemotePlacesLocatorAdapter.new(GEOLocatorRemoteAPI) # adapted

puts 'Actions with local store'
# Adding the interesting places to the local locations store:
local_store.new_finding(48.6734537, 26.5617194)
local_store.new_finding(49.9395077, 14.1858574)

# Showing all interesting places from local store:
local_store.whats_interesting?

puts 'Some single interesting place'
# Getting one random interesting place from local store:
local_store.find_interesting

# When everything is correct in local store, the next actions will affect the
# remote store throught its API adapted by our adapter

puts 'Actions with remote store'
# Showing all existing places from remote API:
remote_store.whats_interesting?

# Adding the interesting places to remote store:
remote_store.new_finding(48.6734537, 26.5617194)
remote_store.new_finding(49.9395077, 14.1858574)

puts 'Updated remote store'
# Showing all existing places from remote API:
remote_store.whats_interesting?

puts 'Some single interesting place'
# Getting one random interesting place from remote store:
remote_store.find_interesting
