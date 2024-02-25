class_name ModifyHealthStatsEffect

var _health : int
var _max_health : int
var _health_modifier : float

var _armor : int
var _armor_modifier : float

func _init(health, max_health, health_modifier, armor, armor_modifier):
	_health = health
	_max_health = max_health
	_health_modifier = health_modifier
	_armor = armor
	_armor_modifier = armor_modifier


func duplicate():
	return ModifyHealthStatsEffect.new(_health, _max_health, 
		_health_modifier, _armor, _armor_modifier)


func scale(_caster):
	pass


func apply_effect(target, _position):
	var component = target.get_node("HealthComponent")
	component._current_health += _health
	component._max_health += _max_health
	component._health_modifier *= _health_modifier
	
	component._armor += _armor
	component._armor_modifier *= _armor_modifier


func reverse_effect(target):
	var component = target.get_node("HealthComponent")
	component._current_health -= _health
	component._max_health -= _max_health
	component._health_modifier /= _health_modifier
	
	component._armor -= _armor
	component._armor_modifier /= _armor_modifier



