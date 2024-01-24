extends CharacterBody2D

class_name Entity
# the base class for all entities (player, enemies)


var _active_effects = []

var _type : Enums.EntityTypes


func setup(type : Enums.EntityTypes):
	_type = type


func add_effects(effects):
	for effect in effects:
		var new = effect.duplicate()
		new.apply_effect(self)


func _process(delta):
	
	var index = _active_effects.size() - 1
	while index >= 0 :
		if _active_effects[index].timer(delta):
			_active_effects.pop_at(index)
		index -= 1

