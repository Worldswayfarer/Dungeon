class_name StatLoader

static var _stat_resources : Dictionary = {

}
static var _path = "res://Resources/Stats/"

static func read_stats() -> void:
	for file_name in DirAccess.get_files_at(_path):
		var stats : Stats  = load(_path + file_name)
		_stat_resources[stats.type] = stats

static var _default_stat = preload("res://Resources/Stats/default_stats.tres")

static func load_stats(type : StringName) -> Dictionary[Enums.Stats, float]:
	var _base_stats : Stats = _stat_resources.get(type, _default_stat).duplicate()
	var _stats : Dictionary[Enums.Stats, float] = {}
	_stats[Enums.Stats.DAMAGE] = _base_stats.damage
	_stats[Enums.Stats.DAMAGE_MULTIPLIER] = _base_stats.damage_multiplier
	_stats[Enums.Stats.SPEED] = _base_stats.speed
	if "speed_multiplier" in _base_stats:
		_stats[Enums.Stats.SPEED_MULTIPLIER] = _base_stats.speed_multiplier
	_stats[Enums.Stats.CURRENT_HEALTH] = _base_stats.current_health
	_stats[Enums.Stats.MAXIMUM_HEALTH] = _base_stats.maximum_health
	_stats[Enums.Stats.HEALTH_MULTIPLIER] = _base_stats.health_multiplier
	return _stats
