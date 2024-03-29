class_name ModifyMovementStatsEffect

var _speed : int
var _speed_modifier : float

func _init(speed, speed_modifier):
	_speed = speed
	_speed_modifier = speed_modifier


func duplicate():
	return ModifyMovementStatsEffect.new(_speed, _speed_modifier)


func scale(_caster):
	pass


func apply_effect(target, _position):
	var component = target.get_node("MovementComponent")
	
	component._speed += _speed
	component._speed_modifier *= _speed_modifier


func reverse_effect(target):
	var component = target.get_node("MovementComponent")
	
	component._speed -= _speed
	component._speed_modifier /= _speed_modifier


