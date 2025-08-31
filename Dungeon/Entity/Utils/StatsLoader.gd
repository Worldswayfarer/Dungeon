class_name StatLoader

static var _stat_resources : Dictionary = {

}
static var _path = "res://Resources/Stats/"

static func read_stats() -> void:
	for file_name in DirAccess.get_files_at(_path):
		var stats : Stats  = load(_path + file_name)
		_stat_resources[stats.type] = stats

static var _default_stat = preload("res://Resources/Stats/default_stats.tres")

static func load_stats(type : StringName) -> Dictionary[StringName, float]:
	var _base_stats : Stats = _stat_resources.get(type, _default_stat).duplicate()
	var _stats : Dictionary[StringName, float] = {}
	_stats[STATS.DAMAGE] = _base_stats.damage
	_stats[STATS.DAMAGE_MULTIPLIER] = _base_stats.damage_multiplier
	_stats[STATS.SPEED] = _base_stats.speed
	if "speed_multiplier" in _base_stats:
		_stats[STATS.SPEED_MULTIPLIER] = _base_stats.speed_multiplier
	_stats[STATS.HEALTH_CURRENT] = _base_stats.current_health
	_stats[STATS.HEALTH_MAXIMUM] = _base_stats.maximum_health
	_stats[STATS.HEALTH_MULTIPLIER] = _base_stats.health_multiplier
	return _stats
