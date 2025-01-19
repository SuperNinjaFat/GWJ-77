extends Control

@onready var buddy_animation_player: AnimationPlayer = $HelperBuddyContainer/HelperBuddy/BuddyAnimationPlayer
@onready var helper_buddy_container: MarginContainer = $HelperBuddyContainer

func _on_butterfly_button_pressed() -> void:
	helper_buddy_container.visible = true
	buddy_animation_player.play("textbox")
	pass # Replace with function body.
