extends Node2D

var _parent = null

func _ready():
	Signals.player_position_updated.connect(change_direction)
	_parent = get_parent()


func change_direction(player_position):
	var direction = player_position - _parent.position
	_parent._direction = direction.normalized()
