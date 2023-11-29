extends Area2D


var _direction : Vector2
var _speed = 100
var _flight_time = 2.
var _effects : Array = []


func setup(new_position, effects : Array = [], mask = 0b100):
	position = new_position
	_direction = get_viewport().get_mouse_position() - position
	rotation = _direction.angle()
	_direction = _direction.normalized()
	
	_effects = effects
	collision_mask = mask


func _process(delta):
	position += _direction * _speed * delta
	if _flight_time <= 0:
		self.queue_free()
	_flight_time -= delta


func _on_body_entered(body):
	for effect in _effects:
		var new = effect.duplicate()
		body._incoming_effects.append(new)
