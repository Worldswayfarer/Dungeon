class_name DamageEffect

extends Effect

var _damage

func _init(damage):
	_damage = damage


func clone():
	return DamageEffect.new(_damage)


func scale(caster):
	var stats = caster.get_node(References._stats_component)._stats
	_damage *= stats[Enums.Stats.DAMAGE] * stats[Enums.Stats.DAMAGE_MULTIPLIER]


func apply_effect(target):
	target.get_node(References._health_component).apply_damage(_damage)
