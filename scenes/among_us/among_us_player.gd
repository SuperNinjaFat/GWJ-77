extends CharacterBody2D

const SPEED = 450

func _physics_process(delta):
    if Input.is_action_pressed("ui_right"):
        velocity.x = SPEED
    elif Input.is_action_pressed("ui_left"):
        velocity.x = -SPEED
    else:
        velocity.x = 0
    
    velocity.y = velocity.y

    if Input.is_action_pressed("ui_up"):
        velocity.y = SPEED
    elif Input.is_action_pressed("ui_left"):
        velocity.y = -SPEED
    else:
        velocity.y = 0
    ## Godot 3:
    #velocity = move_and_slide(velocity, Vector2.UP)
