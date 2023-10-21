extends Node2D

var Parent = null

func _ready():
	Signals.Player_position_updated.connect(changeDirection)
	Parent = get_parent()


func changeDirection(player_position):
	var direction = player_position - position
	Parent.Direction = direction.normalized()
