extends Skill

class_name CastBullet

var _bullet = Enums.ObjectTypes.BULLET


func use_ability(caster, factory):
		if caster == null or factory == null:
			return
		var new_bullet = factory.get_object_instance(_bullet)
		factory.add_child(new_bullet)
		
		
		new_bullet.setup(caster.global_position, get_effects(caster))
