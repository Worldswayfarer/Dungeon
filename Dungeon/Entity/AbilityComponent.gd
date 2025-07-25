extends BaseComponent

class_name AbilityComponent


var abilities = {}
var _ability_slots = []


func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.ABILITY


func _ready():
	setup()


func setup():
	abilities[Enums.ObjectTypes.BULLET] = References._skill_tree.get_skill(Enums.ObjectTypes.BULLET)
	abilities[Enums.ObjectTypes.SHURIKEN] = References._skill_tree.get_skill(Enums.ObjectTypes.SHURIKEN)
	_ability_slots += [Enums.ObjectTypes.BULLET]
	_ability_slots += [Enums.ObjectTypes.SHURIKEN]


func cast_ability(ability_name : Enums.ObjectTypes):
	abilities[ability_name].use_skill(_parent)


func use_slot(slot_number : int):
	cast_ability(_ability_slots[slot_number])
