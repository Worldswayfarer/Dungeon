class_name DamageOverTimeEffect

var _damage_effect
var _duration
var _timer = 0.
var _target
var _name : Enums.Effects

func _init(damage_effect : DamageEffect, name : Enums.Effects, duration : float):
	_damage_effect = damage_effect
	_duration = duration
	_name = name


func duplicate():
	return DamageOverTimeEffect.new(_damage_effect, _name, _duration)


func refresh(duration):
	_duration = duration

func apply_effect(target : Entity):
	
	_target = target
	for effect in _target._active_effects:
		if effect is DamageOverTimeEffect:
			if effect._name == _name:
				effect.refresh(_duration)
				return
	
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
		_target.add_effects([_damage_effect])
