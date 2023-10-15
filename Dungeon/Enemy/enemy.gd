extends Area2D

@export var _speed = 100.0
var _direction = Vector2.ZERO


func _ready():
	Signals.player_position_updated.connect(changeDirection)


func changeDirection(player_position):
	print(player_position)
	_direction = player_position - position
	_direction = _direction.normalized()


func _process(delta):
	position += _direction * _speed * delta
