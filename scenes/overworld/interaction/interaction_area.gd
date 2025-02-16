class_name InteractionArea
extends Area3D

## function to call when interacted with
var interact: Callable = func(_params):
	pass

var enabled: bool = false

func _on_body_entered(_body: Node3D) -> void:
	if !enabled:
		return
	# print("Player entered ", self, ": ", body)
	InteractionManager.register_area(self)

func _on_body_exited(_body: Node3D) -> void:
	if !enabled:
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