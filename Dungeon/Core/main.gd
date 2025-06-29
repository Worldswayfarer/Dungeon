extends Node2D

var _fight_room = preload("res://Core/fight_room.tscn")
var _room
var _factory

func _ready():
	_room = References._room
	_factory = References._factory
	_room.add_child(_fight_room.instantiate())
	Signals.access_next_room.connect(next_room)
	Signals.player_death.connect(end_game)
	Signals.restart_game.connect(restart_game)


func next_room():
	_room.cleanup()
	_room.add_child(_fight_room.instantiate())


func end_game():
	Signals.pause_game.emit()


func restart_game():
	_room.cleanup()
	_room.add_child(_fight_room.instantiate())
	_factory.cleanup()
	var new_player = _factory.get_object_instance(Enums.ObjectTypes.PLAYER)
	_factory.add_child(new_player)
	Signals.pause_game.emit()
