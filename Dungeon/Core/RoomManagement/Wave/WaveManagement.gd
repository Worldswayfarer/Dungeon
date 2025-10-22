extends Node2D
class_name WaveManagement


@export var spawner : Spawner


var _patterns : Array[Encounter] = []
var _current_pattern : Encounter
var _current_room : int = 0
var _max_room : int = 0

var _room_cleared : bool = false

func _ready():
	Signals.access_next_room.connect(next_room)

	_patterns = EncounterLoader.load_all_encounters()
	start_room()

func _process(_delta : float):
	if spawner.count_children() == 0 and !_room_cleared:
		_room_cleared = true
		Signals.end_of_wave.emit()


func next_room():
	_room_cleared = false
	spawner.cleanup()
	if _current_room < _max_room - 1:
		_current_room += 1
	start_room()
	

func start_room():
	_current_pattern = _patterns[_current_room]
	spawner.spawnEncounter(_current_pattern)
