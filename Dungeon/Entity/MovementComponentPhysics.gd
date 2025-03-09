extends Node2D

class_name MovementComponentPhysics

@onready var _parent = get_parent()
var _direction : Vector2 = Vector2.ZERO
@onready var _Stats = _parent.get_node_or_null(References._stats_component)


func _physics_process(delta):
	if _Stats:
		var speed = _Stats.get_stat(Enums.Stats.SPEED)
		_parent.move_and_collide(_direction * speed * delta)
