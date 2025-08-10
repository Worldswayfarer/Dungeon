extends BaseComponent

class_name StatsComponent

var _stats : Dictionary[Enums.Stats, float] = {}

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.STATS


func _ready():
	_stats = StatLoader.load_stats(get_type())
	
func change_stat(stat_name : Enums.Stats, value : float):
	if !_stats.has(stat_name):
		return
	_stats[stat_name] = value

func get_stat(stat_name : Enums.Stats):
	if !_stats.has(stat_name):
		return 1
	return _stats[stat_name]
