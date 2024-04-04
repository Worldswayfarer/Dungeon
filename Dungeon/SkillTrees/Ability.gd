class_name Ability



func use(position, _effects):
	var factory = References._factory
	var new_bullet = factory.get_object_instance(Enums.ObjectTypes.BULLET)
	factory.add_child(new_bullet)
	
	new_bullet.setup(position, _effects)
