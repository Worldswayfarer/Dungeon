class_name DamageOverTimeEffect

var _damage_effect
var _duration
var _timer = 0.
var _target

func _init(damage_effect : DamageEffect, duration : float):
	_damage_effect = damage_effect
	_duration = duration


func duplicate():
	return DamageOverTimeEffect.new(_damage_effect, _duration)


func apply_effect(target : Entity):
	_target = target
	_target._active_effects += [self]


func timer(delta):
	if _duration <= 0:
		return true
	_timer += delta
	if _timer >= 1:
		_duration -= _timer
		_timer = 0.
		if !_target:
			return
		_target._incoming_effects += [_damage_effect]
