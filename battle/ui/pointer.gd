extends TextureRect

@export var options_box: BoxContainer

var index = 0
var move_tween: Tween

var offset = Vector2(-62, -13)

func _ready() -> void:
	if options_box:
		_lerp_to_node_at_index()

func _input(event: InputEvent) -> void:
	var input_dir = Vector2i()
	if event.is_action_pressed("move_down"):
		input_dir.y += 1
	if event.is_action_pressed("move_up"):
		input_dir.y -= 1
	if event.is_action_pressed("move_right"):
		input_dir.x += 1
	if event.is_action_pressed("move_left"):
		input_dir.x -= 1
	
	if input_dir.length_squared() != 0:
		print("input: ", input_dir)
		move(input_dir)
	
	if event.is_action_pressed("interact"):
		_select_at_index()

func move(dir: Vector2i):
	if options_box is HBoxContainer:
		index = wrapi(index + dir.x, 0, options_box.get_child_count())
	if options_box is VBoxContainer:
		index = wrapi(index + dir.y, 0, options_box.get_child_count())
	_lerp_to_node_at_index()

func _lerp_to_node_at_index():
	var obj_at_position = options_box.get_child(index)
	move_tween = get_tree().create_tween().bind_node(self)
	#move_tween.tween_property(self, "global_position", obj_at_position.global_position + (obj_at_position.size * Vector2(0, 0.5)), .2).set_trans(Tween.TRANS_SINE)
	move_tween.tween_property(self, "global_position", obj_at_position.global_position + offset, .2).set_trans(Tween.TRANS_SINE)
	move_tween.tween_property(self, "scale", Vector2(1, 1), .2).set_trans(Tween.TRANS_BOUNCE)
	move_tween.play()

func _select_at_index():
	var obj_at_position = options_box.get_child(index)
	if obj_at_position.has_method("interact"):
		obj_at_position.interact()
