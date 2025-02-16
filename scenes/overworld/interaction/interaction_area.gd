class_name InteractionArea
extends Area3D

## function to call when interacted with
var interact: Callable = func(_params):
	pass

var enabled: bool = false

func is_player_leave_or_exit(body: Node3D):
	return !enabled or !body.is_in_group("player")

func _on_body_entered(body: Node3D) -> void:
	if is_player_leave_or_exit(body):
		return
	# print("Player entered ", self, ": ", body)
	InteractionManager.register_area(self)

func _on_body_exited(body: Node3D) -> void:
	if is_player_leave_or_exit(body):
		return
	# print("Player left ", self, ": ", body)
	InteractionManager.unregister_area(self)

# TODO: See if we can set this also for a signal when inputs are changed
var button_text = "[" + "/".join(PackedStringArray(InputMap.action_get_events("interact").map(func(action_event): return InputEventHelper.get_text(action_event)))) + "]"

@export var action_name: String = "interact"
@onready var label: Label3D = $Label3D

func set_label_text():
	label.text = button_text + " to " + action_name

func show_label():
	label.show()

func hide_label():
	label.hide()