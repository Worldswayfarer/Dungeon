class_name EntityStats

# every stat [a, b, c] composes of a base value [a], a multiplier [b]
# and the combined value [c] (which is used for the calculations) c
# is always 1<=c. Death is handled by the damage function.

var type

@export var _stats_sheet : Dictionary = {}

func _init(init_stats : Dictionary = {}):
	_stats_sheet = init_stats
	_stats_sheet = {
		Enums.Stats.CURRENT_HEALTH : [1,1,1],
		Enums.Stats.MAX_HEALTH : [1,1,1],
		Enums.Stats.SPEED : [1,1,1],
		Enums.Stats.DAMAGE : [1,1,1],
		Enums.Stats.ARMOR : [1,1,1],
	}#only temporary till i have implemented the stat load system


#returns the combined value
func getStat(stat):
	return _stats_sheet[stat][2]

func getFullStat(stat):
	return _stats_sheet[stat]

func modify_stat(stat, base = 0, multiplier = 1):
	_stats_sheet[stat][0] += base
	if multiplier > 0:
		_stats_sheet[stat][1] *= multiplier
	_stats_sheet[stat][2] = _stats_sheet[stat][0] * _stats_sheet[stat][1]
