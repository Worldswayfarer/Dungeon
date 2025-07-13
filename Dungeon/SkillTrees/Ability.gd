class_name Ability
var _effects = []

func use(caster, projectile, direction : Vector2 = Vector2.ZERO, layer = 0b010, mask = 0b100):
	var factory = References._factory
	var new_projectile = factory.get_object_instance(projectile)
	factory.add_child(new_projectile)
	var logic = new_projectile.get_component(Enums.ComponentTypes.LOGIC)

	var damage_effect = DamageEffect.new(1)
	damage_effect.scale(new_projectile)
	damage_effect.scale(caster)
	var effects = [damage_effect]

	var new_direction = direction
	if direction == Vector2.ZERO:
		new_direction = caster.get_viewport().get_mouse_position()
	logic.setup(caster.position, new_direction, effects, layer, mask)
