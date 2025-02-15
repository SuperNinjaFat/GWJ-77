extends Node


## Enabled interaction areas the overworld player is near enough to interact with
var active_areas = []

func register_area(area: InteractionArea):
	active_areas.push_back(area)

func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	if index == -1:
		push_error("Couldn't unregister area ", area.name)
		return
	active_areas.remove_at(index)

# TODO:
## Handle on-frame interaction: Hiding/unhiding input labels based on active_areas (determine priority by sorting them here, too)
## Handle pressing interactions (input delay, _input pressing interaction)