class_name TaskPoint
extends Node3D

# Has a 3D model
# Has an InteractionArea

## Supported task types for this point
@export var task_types: Array[TaskManager.TASK_TYPE]

func set_debug_color(color):
	$Sprite3D.modulate = color