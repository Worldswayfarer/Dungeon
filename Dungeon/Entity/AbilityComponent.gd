extends Node2D

class_name AbilityComponent

@onready var _parent = get_parent()

var abilities = {}
var _ability_slots = []

func _ready():
	setup()


func setup():
	abilities[Enums.Abilities.CAST_BULLET] = get_node("/root/main/SkillTree").get_skill(Enums.Abilities.CAST_BULLET)
	_ability_slots += [Enums.Abilities.CAST_BULLET]
	_ability_slots += [Enums.Abilities.CAST_BULLET]


func cast_ability(ability_name : Enums.Abilities):
	abilities[ability_name].use_skill(_parent)


func use_slot(slot_number : int):
	cast_ability(_ability_slots[slot_number])

