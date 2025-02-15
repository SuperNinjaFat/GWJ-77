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
