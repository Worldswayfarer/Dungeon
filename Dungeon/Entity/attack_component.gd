extends Node2D

var _damage : int = 1
var _damage_modifier : float = 1

var _factory = null

func _ready():
	_factory = get_node("/root/main/ObjectFactory")


func get_damage():
	return _damage * _damage_modifier
