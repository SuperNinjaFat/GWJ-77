class_name TaskBase
extends Node

var completed: bool = false

var point: TaskPoint

func _init(_point: TaskPoint):
	point = _point

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
