class_name Printer
extends TaskBase

func _init(point: TaskPoint) -> void:
	super(point)
	print("Made PRINTER task")


# Triggers the UI interface to come up. Evoke this when interacting with the UI
func _on_interact():
	print("PRINTER UI")
	# await timeout or something