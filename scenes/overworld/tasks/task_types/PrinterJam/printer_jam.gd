class_name PrinterJam
extends TaskBase

var activity1: PackedScene = preload("res://scenes/overworld/tasks/task_types/PrinterJam/PrinterJam.tscn")

func _init(points: Array[TaskPoint]) -> void:
	super(points)
	# print("Made PRINTER_JAM task")

func _on_interact(index):
	print("PRINTER_JAM UI - ", index)
	var activity_ui: PrinterJamUI = activity1.instantiate()
	activity_ui._task = self
	TaskManager.add_ui(activity_ui)
