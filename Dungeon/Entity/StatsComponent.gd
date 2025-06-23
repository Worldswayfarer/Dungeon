extends BaseComponent

class_name StatsComponent

var _stats = {}

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.STATS

func _init():
	_stats[Enums.Stats.DAMAGE] = 10
	_stats[Enums.Stats.DAMAGE_MULTIPLIER] = 1
	_stats[Enums.Stats.SPEED] = 100
	_stats[Enums.Stats.CURRENT_HEALTH] = 10
	_stats[Enums.Stats.MAXIMUM_HEALTH] = 10
	_stats[Enums.Stats.HEALTH_MULTIPLIER] = 1


func get_stat(stat_name : Enums.Stats):
	return _stats[stat_name]
