extends BaseComponent

class_name HealthComponent

var _Stats : StatsComponent
var _Logic

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.HEALTH

func _ready():
	_Stats = get_component(Enums.ComponentTypes.STATS)
	_Logic = get_component(Enums.ComponentTypes.LOGIC)

func apply_damage(damage):
	if _Stats:
		var stats = _Stats._stats
		var current_health = stats[Enums.Stats.CURRENT_HEALTH]
		var health_multiplier = stats[Enums.Stats.HEALTH_MULTIPLIER]
		var combined_health = current_health * health_multiplier
		var health_loss = damage / health_multiplier
		
		stats[Enums.Stats.CURRENT_HEALTH] -= health_loss
		if combined_health - health_loss > 0:
			return
			
		# Player Death will be handled externally
		if _parent._object_type == Enums.ObjectTypes.PLAYER:
			Signals.player_death.emit()
			return
		_parent.queue_free()
	
