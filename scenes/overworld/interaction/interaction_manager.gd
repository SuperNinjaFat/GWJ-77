extends Node3D

@onready var player: OverworldPlayer = get_tree().get_first_node_in_group("player")
@onready var label = $Label3D

const base_text = "[E] to "

var active_areas = []
var can_interact = true

func register_area(area: InteractionArea):
	active_areas.push_back(area)

func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)

# Sort interaction areas by closest to the player
func _sort_areas(_area_a: InteractionArea, _area_b: InteractionArea) -> bool:
	var dist_to_area_a = player.global_position.distance_to(_area_a.global_position)
	var dist_to_area_b = player.global_position.distance_to(_area_b.global_position)
	return dist_to_area_a < dist_to_area_b

# process on-frame interaction
func _physics_process(delta: float) -> void:
	# display interaction when possible
	# hide interaction prompt when not possible
	if can_interact && active_areas.size() > 0:
		# grab the closest interaction area
		active_areas.sort_custom(_sort_areas)
		var area_to_use = active_areas[0]
		# reposition label to the area
		label.global_position = area_to_use.global_position
		label.text = base_text + area_to_use.action_name
		label.show()
	else:
		label.hide()

# handle pressing interaction button
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") && can_interact:
		print("area_size: ", active_areas.size())
		if active_areas.size() > 0:
			can_interact = false
			label.hide()

			await active_areas[0].interact.call()

			can_interact = true