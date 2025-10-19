extends Node2D
class_name WaveManagement

var _path = "res://Resources/Waves/"

@export var spawner : Spawner

var _section_timer_max = 15
@export var _section_timer_current : RoundTime
var _is_wave_running : bool = true

var _patterns : Array[Wave] = []
var _current_pattern : Wave
var _current_wave : int = 0
var _max_wave : int = 0

func _ready():
	Signals.access_next_room.connect(next_wave)

	_read_waves()
	start_room()
	


func next_spawn():
	var next = randi_range(0, _current_pattern.pattern.size()-1)
	return _current_pattern.pattern[next]

func next_wave():
	spawner.cleanup()
	if _current_wave < _max_wave - 1:
		_current_wave += 1
	start_room()
	

func start_room():
	_current_pattern = _patterns[_current_wave]
	_section_timer_current.current_round_time = _section_timer_max
	_is_wave_running = true

func _read_waves() -> void:
	for file_name in DirAccess.get_files_at(_path):
		var w : Wave  = load(_path + file_name).duplicate()
		_patterns += [w]
		_max_wave += 1


func _process(delta):
	_section_timer_current.current_round_time -= delta
	if _is_wave_running and _section_timer_current.current_round_time <= 0:
		_is_wave_running = false
		Signals.end_of_wave.emit()
