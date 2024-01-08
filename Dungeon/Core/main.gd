extends Node2D

var _fight_room = preload("res://Core/fight_room.tscn")
var _room


func _ready():
	_room = get_node("/root/main/Room")
	_room.add_child(_fight_room.instantiate())
	Signals.access_next_room.connect(next_room)


func next_room():
	_room.cleanup()
	_room.add_child(_fight_room.instantiate())
