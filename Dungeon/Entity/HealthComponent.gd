extends Node2D

class_name HealthComponent

@onready var _parent = get_parent()
@onready var _Stats : StatsComponent = _parent.get_node_or_null(References._stats_component)



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
