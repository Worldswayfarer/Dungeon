class_name CastBomb

var _bullet = Enums.ObjectTypes.BOMB
var _attack_component = null
var _factory = null


# since this is not attached to a node, it can't call get_node()
func setup(caster, factory):
	_attack_component = caster.get_node("AttackComponent")
	_factory = factory


func use_ability():
		if _attack_component == null or _factory == null:
			return
		var new_bullet = _factory.get_object_instance(_bullet)
		_factory.add_child(new_bullet)
		
		var effects = []
		effects += [DamageEffect.new(_attack_component.get_damage())]
		
		new_bullet.setup(_attack_component.global_position, effects)
