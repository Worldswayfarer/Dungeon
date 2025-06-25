class_name TemporaryEffect

extends Effect

var _effect
var _duration : float
var _timer : float = 0.
var _target : EffectComponent
var _name : Enums.Effects


func _init(effect, name : Enums.Effects, duration : float):
	_effect = effect
	_name = name
	_duration = duration


func clone():
	return TemporaryEffect.new(_effect, _name, _duration)


func scale(_caster):
	_effect.scale(_caster)


func apply_effect(target):
	_target = target.get_component(Enums.ComponentTypes.EFFECT)
	for effect in _target._active_effects:
		if effect is TemporaryEffect:
			if effect._name == _name:
				effect.refresh()
				return
	
	var clone_obj = clone()
	_target._active_effects += [clone_obj]
	clone_obj._effect.apply_effect(_target)


func timer(delta):
	_timer += delta
	if _timer >= _duration:
		_effect.reverse_effect(_target)
		return true


func refresh():
	_timer = 0


