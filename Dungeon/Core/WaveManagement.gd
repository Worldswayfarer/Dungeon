extends Node2D

var _wave_pattern = []
var _section_timer_max = 15
var _section_timer_current

func _ready():
	_wave_pattern = [[Enums.ObjectTypes.ENEMY, 3]]
	_wave_pattern += [[Enums.ObjectTypes.RANGEDENEMY, 1]]
	_section_timer_current = _section_timer_max


func determine_next_wave():
	var next = randi_range(0, _wave_pattern.size()-1)
	return _wave_pattern[next]


func _process(delta):
	_section_timer_current -= delta
	if _section_timer_current <= 0:
		Signals.end_of_wave.emit()
