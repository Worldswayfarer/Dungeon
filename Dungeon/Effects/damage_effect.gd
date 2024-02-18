class_name DamageEffect

var _damage

func _init(damage):
	_damage = damage


func duplicate():
	return DamageEffect.new(_damage)


func scale(caster):
	_damage *= caster.get_node("AbilityComponent")._damage


func apply_effect(target):
	target.get_node("HealthComponent").apply_damage(_damage)
