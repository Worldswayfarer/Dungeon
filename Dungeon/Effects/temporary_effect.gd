class_name TemporaryEffect

var _effect : StatModifierEffect
var _duration : float
var _timer : float = 0.
var _target : Entity
var _name : Enums.Effects


func _init(effect : StatModifierEffect, name : Enums.Effects, duration : float):
	_effect = effect
	_name = name
	_duration = duration


func duplicate():
	return TemporaryEffect.new(_effect, _name, _duration)


func refresh():
	_timer = 0


func apply_effect(target : Entity):
	_target = target
	for effect in _target._active_effects:
		if effect is TemporaryEffect:
			if effect._name == _name:
				effect.refresh()
				return
	
	_target._active_effects += [self]
	_effect.apply_effect(_target)


func timer(delta):
	_timer += delta
	if _timer >= _duration:
		_effect.reverse_effect(_target)
		return true
