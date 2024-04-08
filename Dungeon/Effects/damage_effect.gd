class_name DamageEffect

var _damage

func _init(damage):
	_damage = damage


func duplicate():
	return DamageEffect.new(_damage)


func scale(caster):
	var stats = caster.get_node(References._stats_component)._stats
	_damage *= stats[Enums.Stats.DAMAGE] * stats[Enums.Stats.DAMAGEMULTIPLIER]


func apply_effect(target):
	target.get_node(References._health_component).apply_damage(_damage)
