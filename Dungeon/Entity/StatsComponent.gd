extends BaseComponent

class_name StatsComponent

var _stats : Dictionary[Enums.Stats, float] = {}

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.STATS


func _ready():
	_stats = StatLoader.load_stats(get_type())
	


func get_stat(stat_name : Enums.Stats):
	return _stats[stat_name]
