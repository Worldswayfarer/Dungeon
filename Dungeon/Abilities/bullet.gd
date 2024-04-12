extends Node2D


var _direction : Vector2
var _speed = 300
var _duration = 4.
var _effects : Array = []
var _hit_box : HitBoxComponent

func setup(new_position, effects : Array = [], layer = 0b100):
	position = new_position
	_direction = get_viewport().get_mouse_position() - position
	rotation = _direction.angle()
	_direction = _direction.normalized()
	
	_effects = effects
	_hit_box = get_node(References._hitbox_component)
	_hit_box.collision_layer = layer


func _process(delta):
	position += _direction * _speed * delta
	if _duration <= 0:
		self.queue_free()
	_duration -= delta


func handle_hitbox(area):
	area.add_effects(_effects)
