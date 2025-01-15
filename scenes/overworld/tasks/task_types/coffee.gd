class_name Coffee
extends TaskBase

func _init(points: Array[TaskPoint]) -> void:
	super(points)
	print("Made COFFEE task")


# Triggers the UI interface to come up. Evoke this when interacting with the UI
func _on_interact(index):
	print("COFFEE UI - ")
	# await timeout or something
