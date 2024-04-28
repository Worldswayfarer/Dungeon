extends Node2D


var _direction : Vector2
var _duration = 4.
var _effects : Array = []
var _hit_box : HitBoxComponent


func setup(new_position, target_position, effects : Array = [], layer = 0b100):
	_effects = effects
	_hit_box = get_node(References._hitbox_component)
	
	_hit_box.collision_layer = layer
	position = new_position
	_direction = target_position - position
	rotation = _direction.angle()
	var movement_Component : MovementComponent = get_node(References._movement_component)
	movement_Component._direction = _direction.normalized()


func _process(delta):
	if _duration <= 0:
		self.queue_free()
	_duration -= delta


func handle_hitbox_entered(area):
	area.add_effects(_effects)
