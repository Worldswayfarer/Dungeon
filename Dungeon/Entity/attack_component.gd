extends Node2D

var _damage : int = 1
var _damage_modifier : float = 1

var _factory = null

func _ready():
	_factory = get_node("/root/main/ObjectFactory")


func get_damage():
	return _damage * _damage_modifier


func attack(type : Enums.ObjectTypes):
		var new_enemy = _factory.get_object_instance(type)
		_factory.add_child(new_enemy)
		
		var effects = []
		effects += [DamageEffect.new(_damage * _damage_modifier)]
		
		new_enemy.setup(global_position, effects)
