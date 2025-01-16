extends Control

# need to know about actions like this, godot is silly
const Action = preload("res://battle/battle_system.gd").Action
const Attack = preload("res://battle/battle_system.gd").Attack

@export var battle_system: BattleSystem
@export var player_battlething: BattleThing
@export var enemy_battlething: BattleThing

func _on_attack_selected() -> void:
	print("I choose to attack!")
	var attack_action = Attack.new(player_battlething, player_battlething.skills[0], [enemy_battlething])
	battle_system.queue_action(attack_action)
	battle_system.start()
