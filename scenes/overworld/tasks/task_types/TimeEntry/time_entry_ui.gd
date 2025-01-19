class_name TimeEntryUI
extends Control

var _task: TimeEntry

@onready var options_dropdown: OptionButton = $"Task-monitor/ContentContainer/Content/TaskOptionButton"
@onready var start_time_dropdown: OptionButton = $"Task-monitor/ContentContainer/Content/TimeButtons/StartTime"
@onready var end_time_dropdown: OptionButton = $"Task-monitor/ContentContainer/Content/TimeButtons/EndTime"

func _on_reset_pressed() -> void:
	options_dropdown.selected = -1
	start_time_dropdown.selected = -1
	end_time_dropdown.selected = -1

enum TIMEENTRY_TASK {FILED_REPORTS, DONUTS, NOTHING, RUNDOWN}

const TIMEENTRY_TO_TEXT = {
	TIMEENTRY_TASK.FILED_REPORTS: "Filed Reports",
	TIMEENTRY_TASK.DONUTS: "Ate Donuts",
	TIMEENTRY_TASK.NOTHING: "Did Nothing",
	TIMEENTRY_TASK.RUNDOWN: "Gave Boss the Rundown"
}

#8 hours in a shift
const HOURS_PER_SHIFT: int = 8
const NUM_OF_OPTIONS: int = (HOURS_PER_SHIFT * 2) + 1

var TIME_OPTIONS: Array[String]

## Generate time options between 8 AM and 4 PM
func build_timeoptions() -> void:
	for i in range(0, HOURS_PER_SHIFT + 1):
		var hour = 8 + i
		var is_pm = hour >= 12
		var am_pm_string: String = "AM"
		if is_pm:
			am_pm_string = "PM"
		if hour >= 13:
			hour = hour - 12
		
		# whole hour
		var minute: String = "00"
		var time_string: String = str(hour) + ":" + str(minute) + " " + am_pm_string
		TIME_OPTIONS.push_back(time_string)
		
		# whole + half hour
		if i != HOURS_PER_SHIFT:
			minute = "30"
			time_string = str(hour) + ":" + str(minute) + " " + am_pm_string
			TIME_OPTIONS.push_back(time_string)
	
	# for i in TIME_OPTIONS.size():
	# 	print(i, ": ", TIME_OPTIONS[i])

## Set random time entry values
@onready var end_time_index = randi_range(1, NUM_OF_OPTIONS - 1)
@onready var start_time_index = randi_range(0, end_time_index - 1)
@onready var task_index = randi() % TIMEENTRY_TASK.size()

@onready var note_taskname = $"Sticky-note/MarginContainer/StickyNoteContent/Task/TaskName"
@onready var note_starttime = $"Sticky-note/MarginContainer/StickyNoteContent/Times/StartTime"
@onready var note_endtime = $"Sticky-note/MarginContainer/StickyNoteContent/Times/EndTime"

func init_stickynote():
	note_taskname.text = TIMEENTRY_TO_TEXT[task_index]
	note_starttime.text = TIME_OPTIONS[start_time_index]
	note_endtime.text = TIME_OPTIONS[end_time_index]

func init_monitor():
	# populate time task dropdown options
	for i in range(0, TIMEENTRY_TASK.size()):
		options_dropdown.add_item(TIMEENTRY_TO_TEXT[i], i)
	options_dropdown.selected = -1

	# populate start/end time dropdown options
	for i in range(0, TIME_OPTIONS.size()):
		start_time_dropdown.add_item(TIME_OPTIONS[i], i)
	start_time_dropdown.selected = -1
	for i in range(0, TIME_OPTIONS.size()):
		end_time_dropdown.add_item(TIME_OPTIONS[i], i)
	end_time_dropdown.selected = -1

func _ready() -> void:
	build_timeoptions()
	init_monitor()
	init_stickynote()

func _on_submit_button_up() -> void:
	# Check if the time entry is valid
	if options_dropdown.selected == task_index && start_time_dropdown.selected == start_time_index && end_time_dropdown.selected == end_time_index:
		print("Task completed!")
		if _task:
			_task.complete()
