class_name Skill
extends Resource

enum TargetType {
	TARGET_SINGLE,
	TARGET_ALL
	}

@export var display_name: String = ""
@export_range(0, 100) var cost: int = 0

@export var attack_flag = false
@export_group("Attack Properties")
@export var damage = 0
@export_range(0.0, 10.0) var attack_mod: float = 1.0
@export_range(0.0, 10.0) var defense_mod: float = 1.0
