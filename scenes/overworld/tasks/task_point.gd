class_name TaskPoint
extends Node3D

# Has a 3D model
# Has an InteractionArea

## Supported task types for this point
@export var task_types: Array[TaskManager.TASK_TYPE]

func set_debug_color(color):
	$Sprite3D.modulate = color

## Used when marking a task as completed, but potentially could be used for other scenarios
func disableInteraction():
	InteractionManager.unregister_area($InteractionArea)
	$InteractionArea.enabled = false
	$Sprite3D.modulate = Color.BLACK
