class_name DamageOverTimeEffect

extends Effect

var _damage_effect
var _duration
var _timer = 0.
var _target : EffectComponent
var _name : Enums.Effects

func _init(damage_effect : DamageEffect, name : Enums.Effects, duration : float):
	_damage_effect = damage_effect
	_duration = duration
	_name = name


func clone():
	return DamageOverTimeEffect.new(_damage_effect.clone(), _name, _duration)


func scale(caster):
	_damage_effect.scale(caster)


func apply_effect(target):
	
	_target = target.get_node(References._effect_component)
	for effect in _target._active_effects:
		if effect is DamageOverTimeEffect:
			if effect._name == _name:
				effect.refresh(_duration)
				return
	
	_target._active_effects += [self.clone()]


func refresh(duration):
	_duration = duration


func timer(delta):
	if _duration <= 0:
		return true
	_timer += delta
	if _timer >= 1:
		_duration -= _timer
		_timer = 0.
		if !_target:
			return
		_damage_effect.apply_effect(_target)
