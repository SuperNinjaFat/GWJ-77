extends Node

# Initialize the game tasks
# Listens to tasks
# Create and remove task UIs
# Calculates scores at the end of the day

const NUM_OF_TASKS = 2

enum TASK_TYPE {NONE = -1, WORKSTATION, COFFEE, PRINTER}

const TASKTYPE_TO_COLOR = {
	TASK_TYPE.COFFEE: Color.ROSY_BROWN,
	TASK_TYPE.WORKSTATION: Color.SKY_BLUE,
	TASK_TYPE.PRINTER: Color.SANDY_BROWN
}

@onready var task_ui_layer: CanvasLayer = $CanvasLayer

var task_points: Array[Node]
var tasks: Array[TaskBase]

func initialize_tasks() -> void:
	# create a `NUM_OF_TASKS` amount of random `TaskBase`s
	# TODO: Only assign certain types of `TaskBase`s to certain types of `TaskPoint`s. ie; Computer related tasks can only be assigned to computers
	# TODO: Verify whether this duplicates references to the original objects
	task_points = get_tree().get_nodes_in_group("task_point")
	var tmp_task_points = task_points.duplicate()
	for i in NUM_OF_TASKS:
		var task_point = tmp_task_points.pop_at(randi() % tmp_task_points.size())
		# print("Task_point: ", task_point.global_position)
		var task_type = task_point.task_types[randi() % task_point.task_types.size()]
		task_point.set_debug_color(TASKTYPE_TO_COLOR[task_type])
		match task_type:
			TASK_TYPE.COFFEE:
				tasks.append(BrewCoffee.new([task_point]))
			TASK_TYPE.WORKSTATION:
				if randi() % 1 == 0:
					tasks.append(CleanUp.new([task_point]))
				else:
					tasks.append(TimeEntry.new([task_point]))
			TASK_TYPE.PRINTER:
				tasks.append(PrinterJam.new([task_point]))

var in_ui: bool = false

func add_ui(ui: Control) -> void:
	# print("Opened UI...")
	in_ui = true
	task_ui_layer.add_child(ui)

func remove_ui() -> void:
	# print("...Closed UI.")
	in_ui = false
	task_ui_layer.get_child(0).queue_free()