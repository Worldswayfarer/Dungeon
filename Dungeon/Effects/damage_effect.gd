class_name DamageEffect

extends Effect

var _damage

func _init(damage):
	_damage = damage


func clone():
	return DamageEffect.new(_damage)


func scale(caster : Root):
	var stats = caster.get_component(Enums.ComponentTypes.STATS)._stats
	_damage *= stats[STATS.DAMAGE] * stats[STATS.DAMAGE_MULTIPLIER]


func apply_effect(target):
	target.get_component(Enums.ComponentTypes.HEALTH).apply_damage(_damage)
