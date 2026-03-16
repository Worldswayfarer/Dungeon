class_name Ability
var _effects = []

func use(caster: Root, projectile, target : Vector2 = Vector2.ZERO, layer = 0b010, mask = 0b100):
	var factory = References.factory
	var caster_stats : StatsComponent = caster.get_component(Enums.ComponentTypes.STATS)
	var projectile_count = caster_stats.get_stat(STATS.PROJECTILES)
	for idx in range(projectile_count):
		var new_projectile = factory.get_object_instance(projectile)
		factory.add_child(new_projectile)
		var logic = new_projectile.get_component(Enums.ComponentTypes.LOGIC)

		var damage_effect = DamageEffect.new(1)
		damage_effect.scale(new_projectile)
		damage_effect.scale(caster)
		var effects = [damage_effect]

		var new_target : Vector2 = target
		if target == Vector2.ZERO:
			new_target = caster.get_viewport().get_mouse_position()
		
		if idx != 0:
			var phi = ((idx % 2) * 2 - 1)  * (idx/projectile_count) * 1/PI
			var direction = new_target - caster.position
			new_target = caster.position  + direction.rotated(phi)
		logic.setup(caster.position, new_target, effects, layer, mask)
