extends CharacterBody2D

const SPEED = 450

func _physics_process(delta):
    # animate
    if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
        get_node("AnimatedSprite2D").play("move")
    else:
        get_node("AnimatedSprite2D").play("idle")

    # apply velocity with movement
    if Input.is_action_pressed("ui_right"):
        velocity.x = SPEED
        get_node("AnimatedSprite2D").flip_h = false
    elif Input.is_action_pressed("ui_left"):
        velocity.x = -SPEED
        get_node("AnimatedSprite2D").flip_h = true
    else:
        velocity.x = 0
    
    # velocity.y = velocity.y

    if Input.is_action_pressed("ui_up"):
        velocity.y = -SPEED
    elif Input.is_action_pressed("ui_down"):
        velocity.y = SPEED
    else:
        velocity.y = 0
    ## Godot 3:
    #velocity = move_and_slide(velocity, Vector2.UP)
    move_and_slide()
