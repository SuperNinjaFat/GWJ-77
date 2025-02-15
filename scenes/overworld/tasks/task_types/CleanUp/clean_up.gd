class_name CleanUp
extends TaskBase

var activity1: PackedScene = preload("res://scenes/overworld/tasks/task_types/CleanUp/CleanUp.tscn")

func _init(points: Array[TaskPoint]) -> void:
	super(points)
	# print("Made CLEAN_UP task")

## Triggers the UI interface to come up. Evoke this when interacting with the UI
func _on_interact(index):
	print("CLEAN_UP UI - ", index)
	var activity_ui: CleanUpUI = activity1.instantiate()
	activity_ui._task = self
	TaskManager.add_ui(activity_ui)

func complete():
	completed = true
	TaskManager.remove_ui()