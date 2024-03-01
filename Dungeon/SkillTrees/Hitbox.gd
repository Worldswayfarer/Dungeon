extends Area2D

class_name Hit_Box

var _parent

func _ready():
	_parent = get_parent()


func _on_body_entered(body):
	_parent.collided_with(body)
