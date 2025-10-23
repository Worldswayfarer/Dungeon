
extends Node2D

var _fight_room = References.fight_room

var _portal_scene = References.portal
var _center_position = Vector2(960, 540)


@export var spawner : Spawner


var _patterns : Array[Encounter] = []
var _current_pattern : Encounter
var _current_room : int = 0
var _max_room : int = 0

var _room_cleared : bool = false
var _room_started


func _ready():
	Signals.end_of_wave.connect(end_of_wave)
	Signals.access_next_room.connect(next_room)
	Signals.restart_game.connect(restart_game)

	spawner = _fight_room.instantiate()
	add_child(spawner)
	_patterns = EncounterLoader.load_all_encounters()
	_max_room = len(_patterns)
	start_room()


func _process(_delta : float):
	if spawner.count_children() == 0 and !_room_cleared and _room_started:
		_room_cleared = true
		Signals.end_of_wave.emit()


func restart_game():
	_current_room = 0
	_room_cleared = false
	_room_started = false
	for child in get_children():
		child.queue_free()
	spawner = _fight_room.instantiate()
	add_child(spawner)
	start_room()
	


func next_room():
	_room_cleared = false
	_room_started = false
	spawner.cleanup()
	var portal = get_node("Portal")
	portal.queue_free()

	if _current_room < _max_room - 1:
		_current_room += 1
	start_room()


func end_of_wave():
	var new_portal = _portal_scene.instantiate()
	new_portal.position = _center_position
	add_child(new_portal)
	

func start_room():
	_current_pattern = _patterns[_current_room]
	spawner.spawnEncounter(_current_pattern)
	_room_started = true
