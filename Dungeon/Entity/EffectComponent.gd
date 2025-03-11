extends Node2D

class_name EffectComponent

var _parent

var _active_effects = []

func _ready():
	_parent = get_parent()

func _process(delta):
	# reversing through list in case some effect gets deleted
	var index = _active_effects.size() - 1
	while index >= 0 :
		if _active_effects[index].timer(delta):
			_active_effects.pop_at(index)
		index -= 1
