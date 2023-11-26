class_name EntityStats

# every stat [a, b, c] composes of a base value [a], a multiplier [b]
# and the combined value [c] (which is used for the calculations) c
# is always 1<=c. Death is handled by the damage function.

var type

@export var _stats_sheet : Dictionary = {}

func _init(init_stats : Dictionary = {}):
	_stats_sheet = init_stats
	set_stat(Enums.Stats.CURRENT_HEALTH, 10, 1)
	set_stat(Enums.Stats.MAX_HEALTH, 10, 1)
	set_stat(Enums.Stats.SPEED, 100, 1)
	set_stat(Enums.Stats.DAMAGE, 1, 1)
	set_stat(Enums.Stats.ARMOR, 10, 1)
	#only temporary till i have implemented the stat load system


func set_stat(stat, base, modifier):
	_stats_sheet[stat] = [base, modifier, base*modifier]


#returns the combined value
func get_stat(stat):
	return _stats_sheet[stat][2]


func get_full_stat(stat):
	return _stats_sheet[stat]


func modify_stat(stat, base = 0, modifier = 1):
	_stats_sheet[stat][0] += base
	if modifier > 0:
		_stats_sheet[stat][1] *= modifier
	_stats_sheet[stat][2] = _stats_sheet[stat][0] * _stats_sheet[stat][1]
