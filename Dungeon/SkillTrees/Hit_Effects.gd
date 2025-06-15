extends Node

class_name  Hit_Effects

func apply_effects(target, effects : Array[Effect]):
	for effect in effects:
		var new_effect = effect.clone()
		new_effect.apply_effect(target)
