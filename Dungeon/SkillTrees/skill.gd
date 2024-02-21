class_name Skill

var _name

var _current_level = 0
var _maximum_level = 3


var _is_castable : bool
var _main_skill = null


# 2-dimensional array, every level is seperate
var _self_effects = []
var _on_hit_effects = []


var _upgrades = []


func _init(name : Enums.Abilities, current_level : int, maximum_level : int, is_castable : bool,
 main_skill = null, self_effects = [], on_hit_effects = [], upgrades = []):
	_name = name
	_current_level = current_level
	_maximum_level = maximum_level
	_is_castable = is_castable
	_main_skill = main_skill
	_self_effects = self_effects
	_on_hit_effects = on_hit_effects
	_upgrades = upgrades


func level_up():
	if _current_level < _maximum_level:
		_current_level += 1


func get_on_hit_effects():
	return _on_hit_effects[_current_level]


func get_self_effects():
	return _self_effects[_current_level]


func aggregate_on_hit_effects(caster):
	var scaled_effects = []
	for effect in _on_hit_effects[_current_level]:
		var new_effect = effect.duplicate()
		new_effect.scale(caster)
		scaled_effects.append(new_effect)
	
	for upgrade in _upgrades:
		scaled_effects.append(upgrade.aggregate_on_hit_effects(caster))
	if _main_skill == null:
		return scaled_effects
	if _is_castable:
		_main_skill._effects.append(scaled_effects)


func aggregate_self_effects(caster):
	var scaled_effects = []
	for effect in _self_effects[_current_level]:
		var new_effect = effect.duplicate()
		new_effect.scale(caster)
		scaled_effects.append(new_effect)
	
	for upgrade in _upgrades:
		scaled_effects.append(upgrade.aggregate_self_effects(caster))
	
	return scaled_effects


func use_skill(caster):
	_main_skill.apply_effect(aggregate_on_hit_effects(caster))
	caster.add_effects(aggregate_self_effects(caster))

