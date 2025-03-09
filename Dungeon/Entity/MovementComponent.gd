extends Node2D

class_name MovementComponent

@onready var _parent = get_parent()
var _direction : Vector2 = Vector2.ZERO

@onready var _Stats = _parent.get_node_or_null(References._stats_component)


func _physics_process(delta):
	if _Stats:
		var speed = _Stats.get_stat(Enums.Stats.SPEED)
		_parent.position += _direction * speed * delta
