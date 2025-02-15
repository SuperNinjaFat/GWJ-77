class_name TimeEntry
extends TaskBase

var activity1: PackedScene = preload("res://scenes/overworld/tasks/task_types/TimeEntry/TimeEntry.tscn")

func _init(points: Array[TaskPoint]) -> void:
	super(points)
	# print("Made TIME_ENTRY task")

func _on_interact(index):
	print("TIME_ENTRY UI - ", index)
	var activity_ui: TimeEntryUI = activity1.instantiate()
	activity_ui._task = self
	TaskManager.add_ui(activity_ui)

func complete():
	completed = true
	TaskManager.remove_ui()