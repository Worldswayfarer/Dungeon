extends Node2D

var _wave_pattern = []
var _wave_timer_max = 15
var _wave_timer_current

func _ready():
	for i in range(10):
		_wave_pattern += [[Enums.ObjectTypes.BASE, 10]]
	_wave_timer_current = _wave_timer_max



func _process(delta):
	_wave_timer_current -= delta
	if _wave_timer_current >= 0:
		Signals.end_of_wave.emit()
