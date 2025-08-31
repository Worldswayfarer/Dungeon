extends BaseComponent

class_name AbilityComponent


var abilities = {}
var _ability_slots = []


func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.ABILITY


func _ready():
	setup()


func setup():
	abilities[IDS.SPELL_BULLET] = References.skill_tree.get_skill(IDS.SPELL_BULLET)
	abilities[IDS.SPELL_SHURIKEN] = References.skill_tree.get_skill(IDS.SPELL_SHURIKEN)
	_ability_slots += [IDS.SPELL_BULLET]
	_ability_slots += [IDS.SPELL_SHURIKEN]


func cast_ability(ability_name : StringName):
	abilities[ability_name].use_skill(_parent)


func use_slot(slot_number : int):
	cast_ability(_ability_slots[slot_number])
