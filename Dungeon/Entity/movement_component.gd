extends Node2D


var _parent
var _direction : Vector2 = Vector2.ZERO

var _speed : int = 100
var _speed_modifier : float = 1


func _ready():
	_parent = get_parent()


func _physics_process(delta):
	_parent.move_and_collide(_direction * _speed * _speed_modifier * delta)
