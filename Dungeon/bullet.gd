extends Area2D

var _damage
var _direction : Vector2
var _speed = 100
var _flight_time = 2.


func setup():
	_direction = get_viewport().get_mouse_position() - global_position
	rotation = _direction.angle()
	_direction = _direction.normalized()
	_damage = DamageEffect.new(1)
	collision_mask = 0b100


func _process(delta):
	position += _direction * _speed * delta
	if _flight_time <= 0:
		self.queue_free()
	_flight_time -= delta


func _on_body_entered(body):
	body._incoming_effects += [_damage]
