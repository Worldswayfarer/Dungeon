class_name Skill

var _name

var _current_level = 0
var _maximum_level = 3


var _is_passive : bool = false
var _is_castable : bool
var _main_skill = null


var _cooldown : float = 0
var _last_casted : float = - 10000

# 2-dimensional array, every level is separate
var _self_effects = []
var _on_hit_effects = []


var _upgrades = []


func _init(name : StringName, current_level : int, maximum_level : int, is_castable : bool,
 main_skill = null, self_effects = [], on_hit_effects = [], upgrades = [], cooldown = 0):
	_name = name
	_current_level = current_level
	_maximum_level = maximum_level
	_is_castable = is_castable
	_main_skill = main_skill
	_self_effects = self_effects
	_on_hit_effects = on_hit_effects
	_upgrades = upgrades
	_cooldown = cooldown


func level_up():
	if _current_level < _maximum_level:
		_current_level += 1


func get_on_hit_effects():
	if _on_hit_effects == [] or _on_hit_effects.size() <= _current_level:
		return []
	return _on_hit_effects[_current_level]


func get_self_effects():
	if _self_effects == [] or _self_effects.size() <= _current_level:
		return []
	return _self_effects[_current_level]


func aggregate_on_hit_effects(caster):
	var scaled_effects = []
	for effect in get_on_hit_effects():
		var new_effect = effect.clone()
		new_effect.scale(caster)
		scaled_effects.append(new_effect)
	
	for upgrade in _upgrades:
		scaled_effects.append_array(upgrade.aggregate_on_hit_effects(caster))
	if _main_skill == null:
		return scaled_effects
	if _is_castable:
		_main_skill._effects.append_array(scaled_effects)
		return _main_skill


func aggregate_self_effects(caster):
	var scaled_effects = []
	for effect in get_self_effects():
		var new_effect = effect.clone()
		new_effect.scale(caster)
		scaled_effects.append(new_effect)
	
	for upgrade in _upgrades:
		scaled_effects.append_array(upgrade.aggregate_self_effects(caster))
	
	return scaled_effects


func use_skill(caster):
	var current_time = Time.get_ticks_msec() / 1000.0
	if _is_passive or ( current_time - _last_casted) < _cooldown:
		return
	if _main_skill != null:
		aggregate_on_hit_effects(caster)
		_main_skill.use(caster, _name)
		_last_casted = current_time
	var effects = aggregate_self_effects(caster)
	for effect in effects:
		effect.apply_effect(caster)
