extends BaseComponent

class_name StatsComponent

var _stats : Dictionary[Enums.Stats, float] = {}
@export var _base_stats : Stats

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.STATS


func _ready():
	_base_stats = _base_stats.duplicate()
	_stats[Enums.Stats.DAMAGE] = _base_stats.damage
	_stats[Enums.Stats.DAMAGE_MULTIPLIER] = _base_stats.damage_multiplier
	_stats[Enums.Stats.SPEED] = _base_stats.speed
	_stats[Enums.Stats.CURRENT_HEALTH] = _base_stats.current_health
	_stats[Enums.Stats.MAXIMUM_HEALTH] = _base_stats.maximum_health
	_stats[Enums.Stats.HEALTH_MULTIPLIER] = _base_stats.health_multiplier


func get_stat(stat_name : Enums.Stats):
	return _stats[stat_name]
