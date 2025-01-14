class_name CleanUp
extends TaskBase

func _init(point: TaskPoint) -> void:
	super(point)
	print("Made CLEAN_UP task")


# Triggers the UI interface to come up. Evoke this when interacting with the UI
func _on_interact():
	print("CLEAN_UP UI")
	# await timeout or something