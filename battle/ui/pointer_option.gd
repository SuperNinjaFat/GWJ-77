extends Label

signal selected

@export var active = true

func interact():
	if active:
		selected.emit()
