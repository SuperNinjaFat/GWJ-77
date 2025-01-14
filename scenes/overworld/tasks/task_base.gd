class_name TaskBase
extends Node

var completed: bool = false

var _point: TaskPoint

func _init(point: TaskPoint):
	_point = point
	var interaction_area: InteractionArea = _point.get_node("InteractionArea")
	if !interaction_area:
		push_error("Couln't initialize interaction area")
		return
	interaction_area.interact = Callable(self, "_on_interact")

# Override
func _on_interact():
	pass