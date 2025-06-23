extends BaseComponent

class_name EffectComponent


var _active_effects = []


func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.EFFECT

func _process(delta):
	# reversing through list in case some effect gets deleted
	var index = _active_effects.size() - 1
	while index >= 0 :
		if _active_effects[index].timer(delta):
			_active_effects.pop_at(index)
		index -= 1
