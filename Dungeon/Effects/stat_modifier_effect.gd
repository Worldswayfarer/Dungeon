class_name StatModifierEffect

var _statName
var _base
var _modifier


func _init(stat_name, base = 1, modifier = 1):
	_statName = stat_name
	_base = base
	_modifier = modifier


func apply_effects(parent_stats : EntityStats):
	parent_stats.modify_stat(_statName, _base, _modifier)
