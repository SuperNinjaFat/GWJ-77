class_name Printer
extends TaskBase

func _init(points: Array[TaskPoint]) -> void:
	super(points)
	print("Made PRINTER task")


# Triggers the UI interface to come up. Evoke this when interacting with the UI
func _on_interact(index):
	super(index)
	print("PRINTER UI - ", index)
	
