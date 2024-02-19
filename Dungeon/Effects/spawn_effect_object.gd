class_name SpawnEffectObject


var _object
var _effects = []

func _init(object : Enums.ObjectTypes):
	_object = object


func duplicate():
	pass


func scale(_caster):
	pass


func apply_effect(caster):
	if caster == null:
		return
	var factory = caster.get_node(References._factory)
	var new_bullet = factory.get_object_instance(_object)
	factory.add_child(new_bullet)
	
	new_bullet.setup(caster.global_position, _effects)