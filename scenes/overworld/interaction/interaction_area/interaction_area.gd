class_name InteractionArea
extends Area3D

@export var action_name: String = "interact"

var interact: Callable = func():
	pass

func _on_body_exited(body: Node3D) -> void:
	InteractionManager.unregister_area(self)
	# print("Exited")

func _on_body_entered(body: Node3D) -> void:
	InteractionManager.register_area(self)
	# print("Entered")
