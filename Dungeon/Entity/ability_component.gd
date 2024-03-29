extends Node2D

var abilities = {}
var _parent


var _damage : int = 2
var _damage_modifier : float = 1


var _ability_slots = []

func _ready():
	_parent = get_parent()
	setup()


func setup():
	abilities[Enums.Abilities.CAST_BULLET] = get_node("/root/main/SkillTree").get_skill(Enums.Abilities.CAST_BULLET)
	_ability_slots += [Enums.Abilities.CAST_BULLET]
	_ability_slots += [Enums.Abilities.CAST_BULLET]


func cast_ability(ability_name : Enums.Abilities):
	abilities[ability_name].use_skill(_parent)


func use_slot(slot_number : int):
	cast_ability(_ability_slots[slot_number])


func get_damage():
	return _damage * _damage_modifier
