extends Node2D

class_name MovementComponentPhysics

var _parent
var _direction : Vector2 = Vector2.ZERO

var _stats_component : StatsComponent

func _ready():
	_parent = get_parent()
	_stats_component = _parent.get_node_or_null(References._stats_component)


func _physics_process(delta):
	if _stats_component:
		var speed = _stats_component.get_stat(Enums.Stats.SPEED)
		_parent.move_and_collide(_direction * speed * delta)
