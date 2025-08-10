
extends Node2D

var _fight_room = References._fight_room

var _portal_scene = References._portal
var _center_position = Vector2(960, 540)

func _ready():
	add_child(_fight_room.instantiate())

	Signals.end_of_wave.connect(end_of_wave)
	Signals.access_next_room.connect(next_room)
	Signals.restart_game.connect(next_room)


func next_room():
	cleanup()
	add_child(_fight_room.instantiate())


func end_of_wave():
	cleanup()
	var new_portal = _portal_scene.instantiate()
	new_portal.position = _center_position
	add_child(new_portal)


func cleanup():
	for child in get_children():
		remove_child(child)
		child.queue_free()
