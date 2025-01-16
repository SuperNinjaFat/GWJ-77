class_name CleanUpUI
extends Control

@onready var trash_count: int = get_tree().get_nodes_in_group("trash").size()

var _task: CleanUp

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	var groups = body.get_groups()
	if groups.has("trash"):
		body.queue_free()
		trash_count = trash_count - 1
		print("Trashed! Trash remaining: ", trash_count)
		if trash_count == 0:
			print("Task completed!")
			_task.complete()
