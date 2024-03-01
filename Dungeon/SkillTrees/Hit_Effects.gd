extends Node

class_name  Hit_Effects

func apply_effects(target, effects):
	for effect in effects:
		var new_effect = effect.duplicate()
		new_effect.apply_effect(target)
