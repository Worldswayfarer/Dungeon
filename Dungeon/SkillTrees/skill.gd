class_name Skill

var _name

var _current_level = 0
var _maximum_level = 3

var _main_skill


# 2-dimensional array, every level is seperate
var _self_effects = []
var _on_hit_effects = []


var _upgrades = []


func _init(name : Enums.Abilities, current_level : int, maximum_level : int,
 main_skill, self_effects = [], on_hit_effects = [], upgrades = []):
	_name = name
	_current_level = current_level
	_maximum_level = maximum_level
	_main_skill = main_skill
	_self_effects = self_effects
	_on_hit_effects = on_hit_effects
	_upgrades = upgrades


func level_up():
	if _current_level < _maximum_level:
		_current_level += 1


func use_skill(caster):
	var combined_effects = _on_hit_effects[_current_level]
	for upgrade in _upgrades:
		pass
	
	var scaled_effects = []
	for effect in combined_effects:
		var new_effect = effect.duplicate()
		new_effect.scale(caster)
		scaled_effects.append(new_effect)
	_main_skill._effects.append_array(scaled_effects)
	_main_skill.apply_effect(caster)
