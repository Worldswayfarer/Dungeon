extends CharacterBody2D

class_name Entity
# the base class for all entities (player, enemies)

var _stats : EntityStats = EntityStats.new()

var _incoming_effects = []
var _active_effects = []

var _direction = Vector2.ZERO

func _physics_process(delta):
	var speed = _stats.get_stat(Enums.Stats.SPEED)
	move_and_collide(_direction*speed * delta)


func _process(delta):
	for effect in _incoming_effects:
		effect.apply_effect(self)
	_incoming_effects = []
	
	var index = _active_effects.size() - 1
	while index >= 0 :
		if _active_effects[index].timer(delta):
			_active_effects.pop_at(index)
		index -= 1
