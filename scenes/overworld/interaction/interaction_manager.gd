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
	area.hide_label()
	active_areas.remove_at(index)


## Handle on-frame interaction: Hiding/unhiding input labels based on active_areas (determine priority by sorting them here, too)
# @onready var player: OverworldPlayer = get_tree().get_first_node_in_group("player")

func _physics_process(_delta: float) -> void:
	if active_areas.size() == 0:
		return
	
	# Prompt interaction for the closest area
	var player: OverworldPlayer = get_tree().get_first_node_in_group("player") # I'm not initializing the player variable with @onready anymore because our interaction manager is a singleton. Using @onready when starting from the menu later resulted in it being null. Is there a standard setup for singletons accessing variables we expect to be initialized during certain scenes? Otherwise my intuition is to take it out of being a singleton and add it to the Office overworld scene.
	if !player:
		push_error("Cannot access player to process interactions")
		return
	# print("Process interactions!")
	var _sort_areas: Callable = func(_area_a: InteractionArea, _area_b: InteractionArea) -> bool:
		var dist_to_area_a = player.global_position.distance_to(_area_a.global_position)
		var dist_to_area_b = player.global_position.distance_to(_area_b.global_position)
		return dist_to_area_a < dist_to_area_b
	active_areas.sort_custom(_sort_areas)
	# print("Prompt for ", active_areas[0])
	active_areas[0].show_label()
	# hide other prompts
	for i in range(1, active_areas.size()):
		active_areas[i].hide_label()

## Handle pressing interactions (input delay, _input pressing interaction)
var input_timer: Timer = Timer.new()
const INPUT_TIMEOUT: float = 0.25

func start_input_timer() -> void:
	input_timer.wait_time = INPUT_TIMEOUT
	input_timer.one_shot = true
	add_child(input_timer)
	# print("input_timer start")
	input_timer.start()
	await input_timer.timeout
	# print("input_timer over")
	# input_timer.queue_free()

# handle pressing interaction button
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") && input_timer.is_stopped():
		if TaskManager.in_ui:
			TaskManager.remove_ui()
		else:
			# print("area_size: ", active_areas.size())
			if active_areas.size() > 0:
				start_input_timer()
				await active_areas[0].interact.call()