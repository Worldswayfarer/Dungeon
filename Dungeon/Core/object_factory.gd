extends Node


@export var _object_scenes : Dictionary = {}


func _enter_tree():
	
	_object_scenes[Enums.ObjectTypes.BASE] = preload("res://Entity/Enemy/enemy.tscn")
	_object_scenes[Enums.ObjectTypes.BULLET] = preload("res://Abilities/Bullet.tscn")


func get_object_instance(type : Enums.ObjectTypes):
	var object = _object_scenes[type]
	if object:
		return _object_scenes[type].instantiate()
	return null
