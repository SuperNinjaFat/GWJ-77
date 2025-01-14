class_name TaskPoint
extends Node3D

const common = preload("res://scenes/overworld/tasks/task_types/task_types_common.gd")

# Has a 3D model
# Has an InteractionArea

# Has supported task types
@export var task_types: Array[common.TASK_TYPE]