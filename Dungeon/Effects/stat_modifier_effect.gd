class_name StatModifierEffect

# One time modification of the target stats. Used for equipment.
# Open unequipping the effect should be reversed.


var _statName
var _base
var _modifier


func _init(stat_name, base : int = 1, modifier : float = 1):
	_statName = stat_name
	_base = base
	_modifier = modifier


func apply_effect(target):
	target._stats.modify_stat(_statName, _base, _modifier)
