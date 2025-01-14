class_name TaskPoint
extends Node3D

# Has a 3D model
# Has an InteractionArea
# @onready var interaction_area: InteractionArea = $InteractionArea

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# if interaction_area:
	var interactionArea: InteractionArea = $InteractionArea
	interactionArea.interact = Callable(self, "_on_interact")

# func _process(delta: float) -> void:
# 	pass

var has_task: bool = false

# Triggers the UI interface to come up. Evoke this when interacting with the UI
func _on_interact():
	# if has_task:
	# 	print("Make UI come up for a task")
	print("Make UI come up for a task")
	# await timeout or something