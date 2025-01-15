# class_name TaskManager
extends Node

# Initialize the game tasks
# Listens to tasks
# Calculates scores at the end of the day

const NUM_OF_TASKS = 2

const common = preload("res://scenes/overworld/tasks/task_types/task_types_common.gd")

@onready var task_points = get_tree().get_nodes_in_group("task_point")
var tasks: Array[TaskBase]

func initialize_tasks() -> void:
	# create a `NUM_OF_TASKS` amount of random `TaskBase`s
	# TODO: Only assign certain types of `TaskBase`s to certain types of `TaskPoint`s. ie; Computer related tasks can only be assigned to computers
	# TODO: Verify whether this duplicates references to the original objects
	var tmp_task_points = task_points.duplicate()
	for i in NUM_OF_TASKS:
		var task_point = tmp_task_points.pop_at(randi() % tmp_task_points.size())
		print("Task_point: ", task_point.global_position)
		var task_type = task_point.task_types[randi() % task_point.task_types.size()]
		match task_type:
			common.TASK_TYPE.COFFEE:
				tasks.append(Coffee.new(task_point))
			common.TASK_TYPE.WORKSTATION:
				tasks.append(CleanUp.new(task_point))
			common.TASK_TYPE.PRINTER:
				tasks.append(Printer.new(task_point))
	
	print("Tasks: ", tasks)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize_tasks()