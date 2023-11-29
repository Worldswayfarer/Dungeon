extends Node2D
class_name DamageEffect

var _damage

func _init(damage):
	_damage = damage


func apply_effect(target):
	var current_health = target._stats.get_full_stat(Enums.Stats.CURRENT_HEALTH)
	
	var health_loss = _damage/current_health[1]
	
	# death is handled by the game controller
	if current_health[0] - health_loss <= 0:
		Signals.entity_death.emit(target)
		target.queue_free()
	target._stats.modify_stat(Enums.Stats.CURRENT_HEALTH, -health_loss)
