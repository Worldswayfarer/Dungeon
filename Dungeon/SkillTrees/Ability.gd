class_name Ability
var _effects = []

func use(caster, projectile):
	var factory = References._factory
	var new_projectile = factory.get_object_instance(projectile)
	factory.add_child(new_projectile)
	var logic = new_projectile.get_component(Enums.ComponentTypes.LOGIC)

	var damage_effect = DamageEffect.new(1)
	damage_effect.scale(new_projectile)
	damage_effect.scale(caster)
	var effects = [damage_effect]

	logic.setup(caster.position, caster.get_viewport().get_mouse_position(), effects)
