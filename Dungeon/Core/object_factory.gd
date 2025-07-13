extends Node

class_name ObjectFactory

@export var _object_scenes : Dictionary = {}


func _enter_tree():
	
	_object_scenes[Enums.ObjectTypes.ENEMY] = preload("res://Entity/Enemy/enemy.tscn")
	_object_scenes[Enums.ObjectTypes.RANGEDENEMY] = preload("res://Entity/Enemy/ranged_enemy.tscn")
	_object_scenes[Enums.ObjectTypes.BULLET] = preload("res://Abilities/Bullet.tscn")
	_object_scenes[Enums.ObjectTypes.PLAYER] = preload("res://Entity/Player/player.tscn")
	_object_scenes[Enums.ObjectTypes.SHURIKEN] = preload("res://Abilities/Shuriken/Shuriken.tscn")


func get_object_instance(type : Enums.ObjectTypes):
	var object = _object_scenes[type]
	if object:
		var new_obj = _object_scenes[type].instantiate()
		new_obj.setup(type)
		return new_obj
	return null


func cleanup():
	for child in get_children():
		remove_child(child)
		child.queue_free()
