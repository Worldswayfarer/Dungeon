extends Node2D

class_name EffectComponent

var _parent

var _incoming_effects = []
var _active_effects = []

func _ready():
	_parent = get_parent()

func add_effects(effects):
	_incoming_effects.append_array(effects)

func _process(delta):
	for effect in _incoming_effects:
		var new = effect.duplicate()
		new.apply_effect(_parent)
	
	var index = _active_effects.size() - 1
	while index >= 0 :
		if _active_effects[index].timer(delta):
			_active_effects.pop_at(index)
		index -= 1
