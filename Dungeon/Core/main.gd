extends Node2D

var _fight_room = preload("res://Core/fight_room.tscn")
var _room


func _ready():
	_room = get_node("/root/main/Room")
	_room.add_child(_fight_room.instantiate())
	Signals.access_next_room.connect(next_room)
	Signals.player_death.connect(end_game)


func next_room():
	var player_health = get_node("/root/main/Player/HealthComponent")
	player_health._current_health = player_health._max_health
	_room.cleanup()
	_room.add_child(_fight_room.instantiate())


func end_game():
	Signals.pause_game.emit()
