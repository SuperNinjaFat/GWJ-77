extends CharacterBody3D
class_name OverworldPlayer

const SPEED = 7.5

func _physics_process(delta):
	if TaskManager.in_ui:
		get_node("AnimatedSprite3D").play("idle")
		return

	# animate
	if Input.is_action_pressed("move_right") || Input.is_action_pressed("move_left") || Input.is_action_pressed("move_up") || Input.is_action_pressed("move_down"):
		get_node("AnimatedSprite3D").play("move")
	else:
		get_node("AnimatedSprite3D").play("idle")

	# apply velocity with movement
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		get_node("AnimatedSprite3D").flip_h = false
	elif Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		get_node("AnimatedSprite3D").flip_h = true
	else:
		velocity.x = 0
	
	# velocity.z = velocity.z

	if Input.is_action_pressed("move_up"):
		velocity.z = -SPEED
	elif Input.is_action_pressed("move_down"):
		velocity.z = SPEED
	else:
		velocity.z = 0
	## Godot 3:
	#velocity = move_and_slide(velocity, Vector2.UP)
	move_and_slide()
