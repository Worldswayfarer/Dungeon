extends Node

class_name ObjectFactory

@export var _object_scenes : Dictionary = {}


func _enter_tree():
	
	_object_scenes[IDS.ENEMY] = preload("res://Entity/Enemy/enemy.tscn")
	_object_scenes[IDS.ENEMY_RANGED] = preload("res://Entity/Enemy/ranged_enemy.tscn")
	_object_scenes[IDS.SPELL_BULLET] = preload("res://Abilities/Bullet/Bullet.tscn")
	_object_scenes[IDS.PLAYER] = preload("res://Entity/Player/player.tscn")
	_object_scenes[IDS.SPELL_SHURIKEN] = preload("res://Abilities/Shuriken/Shuriken.tscn")
	_object_scenes[IDS.ENEMY_CHARGER] = preload("res://Entity/Enemy/charger.tscn")


func get_object_instance(type : StringName):
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
