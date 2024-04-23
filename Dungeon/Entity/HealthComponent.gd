extends Node2D

class_name HealthComponent

var _parent = null
var _stats_component : StatsComponent


func _ready():
	_parent = get_parent()
	_stats_component = _parent.get_node_or_null(References._stats_component)


func apply_damage(damage):
	if _stats_component:
		var stats = _stats_component._stats
		var current_health = stats[Enums.Stats.CURRENT_HEALTH]
		var health_multiplier = stats[Enums.Stats.HEALTH_MULTIPLIER]
		var combined_health = current_health * health_multiplier
		var health_loss = damage / health_multiplier
		
		if combined_health - health_loss <= 0:
			if _parent._type == Enums.EntityTypes.PLAYER:
				Signals.player_death.emit()
			else:
				_parent.queue_free()
		stats[Enums.Stats.CURRENT_HEALTH] -= health_loss
