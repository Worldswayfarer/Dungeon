class_name TemporaryEffect

var _effect
var _duration
var _timer = 0.
var _target

func _init(effect : StatModifierEffect, duration : float):
	_effect = effect
	_duration = duration


func apply_effect(target : Entity):
	_target = target
	_target._active_effects += [self]
	_effect.apply_effect(_target)


func timer(delta):
	_timer += delta
	if _timer >= _duration:
		_effect.reverse_effect(_target)
		return true
