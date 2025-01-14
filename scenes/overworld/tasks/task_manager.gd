class_name TaskManager
extends Node

# Initialize the game tasks
# Listens to tasks
# Calculates scores at the end of the day

const NUM_OF_TASKS = 1

@export var task_points: Array[TaskPoint]
var tasks: Array[TaskBase]

func initialize_tasks() -> void:
	# create a `NUM_OF_TASKS` amount of random `TaskBase`s
	# TODO: Only assign certain types of `TaskBase`s to certain types of `TaskPoint`s. ie; Computer related tasks can only be assigned to computers
	# TODO: Verify whether this duplicates references to the original objects
	var tmp_task_points: Array[TaskPoint] = task_points.duplicate()
	for i in NUM_OF_TASKS:
		var random_index = randi() % tmp_task_points.size() # + 1
		print("random_index: ", random_index)
		tasks.append(TaskBase.new(tmp_task_points.pop_at(random_index)))
	
	print("Tasks: ", tasks)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize_tasks()