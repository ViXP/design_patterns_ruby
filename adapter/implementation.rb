# User recearches the interesting places on planet Earth. He have his 
# own local store for geographical coordinates, he wish to save, and also
# he can save it to the remote store through some non-mutable API with
# strange methods names. Luckly, he can use the adapter for work with remote API
# with the same interface as with local store.
#
# TARGET LocalPlacesLocator
# ADAPTER RemotePlacesLocatorAdapter
# ADAPTEE GEOLocatorRemoteAPI

require './target'
require './adaptee'
require './adapter'

local_store = LocalPlacesLocator.new # local store
remote_store = RemotePlacesLocatorAdapter.new(GEOLocatorRemoteAPI) # adapted remote store

puts 'Actions with local store'
local_store.new_finding(48.6734537, 26.5617194) # adding the interesting place to the local locations store
local_store.new_finding(49.9395077, 14.1858574) # adding the other interesting place to the local locations store
local_store.whats_interesting? # show all the interesting places from local store
puts 'Some single interesting place'
local_store.find_interesting # get one random interesting place from local store

# When everything is correct in local store, the next actions will affect the remote 
# store throught its API adapted by our adapter
puts 'Actions with remote store'
remote_store.whats_interesting? # show all existing places from remote API
remote_store.new_finding(48.6734537,26.5617194) # adding the first interesting place to remote store
remote_store.new_finding(49.9395077,14.1858574) # adding the other interesting place to remote store
puts 'Updated remote store'
remote_store.whats_interesting? # show all interesting places from remote store
puts 'Some single interesting place'
remote_store.find_interesting # get one random interesting place from remote store