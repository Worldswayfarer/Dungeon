extends BaseComponent

class_name HealthComponent

var _Stats : StatsComponent

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.HEALTH

func _ready():
	_Stats = get_component(Enums.ComponentTypes.STATS)

func apply_damage(damage):
	if _Stats:
		var stats = _Stats._stats
		var current_health = stats[Enums.Stats.CURRENT_HEALTH]
		var health_multiplier = stats[Enums.Stats.HEALTH_MULTIPLIER]
		var combined_health = current_health * health_multiplier
		var health_loss = damage / health_multiplier
		
		if combined_health - health_loss <= 0:
			_parent.queue_free()
		stats[Enums.Stats.CURRENT_HEALTH] -= health_loss
