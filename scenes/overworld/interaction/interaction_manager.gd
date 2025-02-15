extends Node


## Enabled interaction areas the overworld player is near enough to interact with
var active_areas = []

# TODO:
## Expose adding and removing an interaction area to active_areas for when the overworld player leaves them.
## Handle on-frame interaction: Hiding/unhiding input labels based on active_areas (determine priority by sorting them here, too)
## Handle pressing interactions (input delay, _input pressing interaction)