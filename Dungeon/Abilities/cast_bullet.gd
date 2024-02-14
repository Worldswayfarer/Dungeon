class_name CastBullet

var _bullet = Enums.ObjectTypes.BULLET
var _ability_component = null
var _factory = null

var _damage = 1

# since this is not attached to a node, it can't call get_node()
func setup(caster, factory):
	_ability_component = caster.get_node("AbilityComponent")
	_factory = factory


func update_stats(stats):
	_damage = stats[Enums.Stats.DAMAGE]


func use_ability():
		if _ability_component == null or _factory == null:
			return
		var new_bullet = _factory.get_object_instance(_bullet)
		_factory.add_child(new_bullet)
		
		var effects = []
		effects += [DamageEffect.new(_damage * _ability_component.get_damage())]
		
		new_bullet.setup(_ability_component.global_position, effects)
