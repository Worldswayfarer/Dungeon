extends Resource


class_name EntityStats

@export var Stats_sheet : Dictionary = {
	Enums.Stats.CURRENT_HEALTH : 1,
	Enums.Stats.HEALTH_MULTIPLIER : 1,
	Enums.Stats.MAX_HEALTH : 1,
	Enums.Stats.SPEED : 1,
}


func getStat(stat):
	return Stats_sheet[stat]


func setStat(stat, value):
	Stats_sheet[stat] = value


func addStat(stat, value):
	Stats_sheet[stat] += value
