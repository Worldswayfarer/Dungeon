class_name Ability

var _effects = []


func use(caster):
	var factory = References._factory
	var new_bullet = factory.get_object_instance(Enums.ObjectTypes.BULLET)
	factory.add_child(new_bullet)
	
	new_bullet.setup(caster.position, _effects)
