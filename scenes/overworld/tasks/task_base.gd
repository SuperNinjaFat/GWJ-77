class_name TaskBase
extends Object

var completed: bool = false

var _progress = 0
var _points: Array[TaskPoint]

func _init(points: Array[TaskPoint]):
	_points = points
	
	var i = 0
	for point in _points:
		var interaction_area: InteractionArea = point.get_node("InteractionArea")
		if !interaction_area:
			push_error("Couln't initialize interaction area")
			return
		# print("Initialized interaction area ", interaction_area.name)
		interaction_area.interact = Callable(self, "_on_interact").bind(i)
		interaction_area.enabled = true
		i += 1

# Override
func _on_interact(index):
	if index != _progress:
		return
