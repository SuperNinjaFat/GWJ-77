class_name Coffee
extends TaskBase

func _init(point: TaskPoint) -> void:
	super(point)
	print("Made COFFEE task")


# Triggers the UI interface to come up. Evoke this when interacting with the UI
func _on_interact():
	print("COFFEE UI")
	# await timeout or something