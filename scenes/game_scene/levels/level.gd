extends Node

signal level_won
signal level_lost

var level_state : LevelState

func _ready():
	level_state = GameState.get_level_state(scene_file_path)

func _on_color_picker_button_color_changed(color):
	level_state.color = color
	GlobalState.save()
