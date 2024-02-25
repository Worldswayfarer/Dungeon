class_name SpawnEffectObject


var _object
var _effects = []


func _init(object : Enums.ObjectTypes, effects = []):
	_object = object
	_effects = effects


func duplicate():
	return SpawnEffectObject.new(_object, _effects)


func scale(_caster):
	pass


func apply_effect(_target, position):
	var factory = References._factory
	var new_bullet = factory.get_object_instance(_object)
	factory.add_child(new_bullet)
	
	new_bullet.setup(position, _effects)
