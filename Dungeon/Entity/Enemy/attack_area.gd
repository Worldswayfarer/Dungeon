extends Node2D

var _parent
var _damage_timer : float = 0
var _max_timer :float = 0.5
var _attacking : bool = false
var _target
var _effects : Array = [DamageEffect.new(10)]

var targets = []

func _ready():
	_parent = get_parent()


func _process(delta):
	if _attacking:
		_damage_timer -= delta
		if _damage_timer <= 0:
			for target in targets:
				target.add_effects(_effects)
			_damage_timer = _max_timer
	else:
		_damage_timer = _max_timer

var _type = Enums.ObjectTypes.BULLET


func handle_hitbox(area):
	if area in targets:
		targets.remove(area)
	else:
		targets.append(area)
