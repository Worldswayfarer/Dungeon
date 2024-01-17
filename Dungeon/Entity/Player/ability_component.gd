extends Node2D

var abilities = {}
var _parent
var _object_factory

var _ability_slots = []

func _ready():
	_parent = get_parent()
	_object_factory =  get_node("/root/main/ObjectFactory")
	var bullet = CastBullet.new()
	bullet.setup(_parent,_object_factory)
	abilities[Enums.Abilities.BULLET] = bullet
	_ability_slots += [Enums.Abilities.BULLET]
	_ability_slots += [Enums.Abilities.BULLET]


func cast_ability(ability_name : Enums.Abilities):
		abilities[ability_name].use_ability()


func use_slot(slot_number : int):
	cast_ability(_ability_slots[slot_number])
