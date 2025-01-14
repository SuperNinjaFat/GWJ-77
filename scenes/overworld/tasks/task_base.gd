class_name TaskBase
extends Node

var completed: bool = false

var _point: TaskPoint

func _init(point: TaskPoint):
	_point = point
