extends Node2D

# need to know about actions like this, godot is silly
const Action = preload("res://battle/battle_system.gd").Action
const Attack = preload("res://battle/battle_system.gd").Attack

@export var battle_system: BattleSystem

#test battle
func _ready():
	var my_battle_thing = $BattleThing
	var enemy_battle_thing = %Enemy/BattleThing
	var attack_action = Attack.new(my_battle_thing, my_battle_thing.skills[0], [enemy_battle_thing])
	battle_system.queue_action(attack_action)
	battle_system.start()
