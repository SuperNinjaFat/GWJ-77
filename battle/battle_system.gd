class_name BattleSystem
extends Node

# different type of actions
# ATTACK - Uses your Battlething's "attack" skill
# SKILL - Uses a skill that will cost bp (bug points)
# ROLL?? - Roll 2 die, insert into a later attack
# RUNAWAY?? - Escape battle with a negative penalty

class Action:
	var _source: BattleThing
	signal finished
	
	func _init(source):
		_source = source
	
	func do():
		print(_source.nickname + " did a thing!")

class Attack extends Action:
	var _skill: Skill
	var _targets: Array
	func _init(source, skill, targets):
		super(source)
		_skill = skill
		_targets = targets
	
	func do():
		# dont pay costs. Attacks dont have cost, even if the skill has cost
		for target in _targets:
			# do the attack stuff. Changing this equation later
			var dmg = max(_source.attack - target.defense, 0) + _skill.damage
			print(_source.nickname, " deals ",  dmg, " damage to ", target.nickname)
		emit_signal("finished")

var _action_queue := []

func queue_action(action: Action):
	_action_queue.append(action)

func start():
	_resolve_next_action()

func _resolve_next_action():
	if !_action_queue.is_empty():
		var action = _action_queue.pop_front()
		action.finished.connect(_resolve_next_action, CONNECT_ONE_SHOT)
		action.do()
	else:
		print("Actions complete!")
