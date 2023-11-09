class_name Effects


var Stats : EntityStats
var Damage = 0


func _init(new_stats : EntityStats, damage = 0):
	Stats = new_stats
	Damage = damage


func applyEffects(parent_stats : EntityStats):
	for stat in Stats.Stats_sheet:
		parent_stats.addStat(stat, stat[0])
		parent_stats.multStat(stat, stat[1])
