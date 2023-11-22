class_name StatModifierEffect

var _statName
var _base
var _multiplier


func _init(stat_name, base = 1, multiplier = 1):
	_statName = stat_name
	_base = base
	_multiplier = multiplier


func apply_effects(parent_stats : EntityStats):
	parent_stats.modifyStat(_statName, _base, _multiplier)
