extends Node2D

var abilities = {}
var _parent
var _object_factory

func _ready():
	_parent = get_parent()
	_object_factory =  get_node("/root/main/ObjectFactory")
	var bullet = CastBullet.new()
	bullet.setup(_parent,_object_factory)
	abilities[Enums.Abilities.BULLET] = bullet


func cast_ability(ability_name):
	abilities[ability_name].use_ability()
