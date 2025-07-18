class_name StatLoader

static var _stat_resources : Dictionary = {
	Enums.ObjectTypes.BULLET : preload("res://Resources/Stats/bullet.tres"),
	Enums.ObjectTypes.ENEMY : preload("res://Resources/Stats/base_enemy.tres"),
	Enums.ObjectTypes.PLAYER : preload("res://Resources/Stats/player.tres"),
	Enums.ObjectTypes.SHURIKEN : preload("res://Resources/Stats/shuriken.tres"),
}

static var _default_stat = preload("res://Resources/Stats/default_stats.tres")

static func load_stats(type : Enums.ObjectTypes) -> Dictionary[Enums.Stats, float]:
	var _base_stats : Stats = _stat_resources.get(type, _default_stat).duplicate()
	var _stats : Dictionary[Enums.Stats, float] = {}
	_stats[Enums.Stats.DAMAGE] = _base_stats.damage
	_stats[Enums.Stats.DAMAGE_MULTIPLIER] = _base_stats.damage_multiplier
	_stats[Enums.Stats.SPEED] = _base_stats.speed
	_stats[Enums.Stats.CURRENT_HEALTH] = _base_stats.current_health
	_stats[Enums.Stats.MAXIMUM_HEALTH] = _base_stats.maximum_health
	_stats[Enums.Stats.HEALTH_MULTIPLIER] = _base_stats.health_multiplier
	return _stats
