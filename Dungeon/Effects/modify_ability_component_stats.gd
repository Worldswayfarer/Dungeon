class_name ModifyAttackStatsEffect

var _attack : int
var _attack_modifier : float

func _init(attack, attack_modifier):
	_attack = attack
	_attack_modifier = attack_modifier


func duplicate():
	return ModifyAttackStatsEffect.new(_attack, _attack_modifier)


func scale(_caster):
	pass


func apply_effect(target, _position):
	var component = target.get_node("AbilityComponent")
	
	component._attack += _attack
	component._attack_modifier *= _attack_modifier




func reverse_effect(target):
	var component = target.get_node("HealthComponent")
	
	component._attack -= _attack
	component._attack_modifier /= _attack_modifier
