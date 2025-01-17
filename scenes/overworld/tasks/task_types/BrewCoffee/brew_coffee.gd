class_name BrewCoffee
extends TaskBase

var activity1: PackedScene = preload("res://scenes/overworld/tasks/task_types/BrewCoffee/BrewCoffee.tscn")

func _init(points: Array[TaskPoint]) -> void:
	super(points)

## Triggers the UI interface to come up. Evoke this when interacting with the UI
func _on_interact(index):
	print("BREW_COFFEE UI - ", index)
	var activity_ui: BrewCoffeeUI = activity1.instantiate()
	activity_ui._task = self
	TaskManager.add_ui(activity_ui)