class_name BattleThing
extends Node

var nickname = "A Bug"
var skills = []

signal on_attack(dmg, targets, callback)
signal on_hit(dmg, callback)

var attack = 1
var defense = 1

func _init():
	load_skills()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func load_skills():
	#TODO: more rigorous determination of what skills this thing has
	# right now, attack!
	var attack = load("res://battle/skills/Attack.tres")
	skills.append(attack)
