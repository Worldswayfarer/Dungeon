
extends Node2D

var _fight_room = References.fight_room

var _portal_scene = References.portal
var _center_position = Vector2(960, 540)

func _ready():
	add_child(_fight_room.instantiate())

	Signals.end_of_wave.connect(end_of_wave)
	Signals.access_next_room.connect(next_room)
	Signals.restart_game.connect(next_room)


func next_room():
	var portal = get_node("Portal")
	remove_child(portal)
	Spawner.start_spawning()


func end_of_wave():
	Spawner.stop_spawning()
	var new_portal = _portal_scene.instantiate()
	new_portal.position = _center_position
	add_child(new_portal)
