class_name InteractionArea
extends Area3D

const base_text = "[E] to "

@export var action_name: String = "interact"
@export var label: Label3D

var interact: Callable = func(index):
	pass

func show_label():
	label.text = base_text + action_name
	label.show()

func hide_label():
	label.hide()

var enabled: bool = false

func _on_body_exited(body: Node3D) -> void:
	if !enabled:
		return
	InteractionManager.unregister_area(self)
	# print("Exited")

func _on_body_entered(body: Node3D) -> void:
	if !enabled:
		return
	InteractionManager.register_area(self)
	# print("Entered")
pass
