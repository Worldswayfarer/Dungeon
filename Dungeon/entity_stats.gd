extends Resource


class_name EntityStats


# every stat [a, b] composes of a base value [a] and a multiplier [b]
# the base stat is always 1<=


@export var Stats_sheet : Dictionary = {
	Enums.Stats.CURRENT_HEALTH : [1,1],
	Enums.Stats.MAX_HEALTH : [1,1],
	Enums.Stats.SPEED : [1,1],
	Enums.Stats.DAMAGE : [1,1],
	Enums.Stats.ARMOR : [1,1]
}



func getStat(stat):
	return Stats_sheet[stat]


func setStat(stat, value):
	Stats_sheet[stat] = value


func addStat(stat, value):
	Stats_sheet[stat] += value


func multStat(stat, value):
	if value < 0: return
	Stats_sheet[stat] *= value
