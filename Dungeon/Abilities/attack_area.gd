extends Node2D


var _damage_timer : float = 0
var _max_timer :float = 0.5
var _attacking : bool = false
var _effects : Array = [DamageEffect.new(10)]

var _targets = []


func _process(delta):
	if _attacking:
		_damage_timer -= delta
		if _damage_timer <= 0:
			for target in _targets:
				target.add_effects(_effects)
			_damage_timer = _max_timer
	else:
		_damage_timer = _max_timer


func handle_hitbox(area):
	if area in _targets:
		_targets.remove(area)
	else:
		_targets.append(area)
