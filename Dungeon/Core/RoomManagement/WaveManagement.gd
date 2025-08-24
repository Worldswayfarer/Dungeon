extends Node2D
class_name WaveManagement

var _wave = preload("res://Resources/Waves/first.tres")
var _pattern : Wave
var _section_timer_max = 15
var _section_timer_current

func _ready():
	_pattern = _wave.duplicate()
	_section_timer_current = _section_timer_max


func determine_next_wave():
	var next = randi_range(0, _pattern.pattern.size()-1)
	return _pattern.pattern[next]


func _process(delta):
	_section_timer_current -= delta
	if _section_timer_current <= 0:
		Signals.end_of_wave.emit()
