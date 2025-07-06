class_name Ability

var _effects = []


func use(caster, projectile):
	var factory = References._factory
	var new_projectile = factory.get_object_instance(projectile)
	factory.add_child(new_projectile)
	var logic = new_projectile.get_component(Enums.ComponentTypes.LOGIC)
	logic.setup(caster.position, caster.get_viewport().get_mouse_position(), _effects)
