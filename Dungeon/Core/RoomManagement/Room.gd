
extends Node2D

var _fight_room = References.fight_room

var _portal_scene = References.portal
var _center_position = Vector2(960, 540)

func _ready():
	add_child(_fight_room.instantiate())

	Signals.end_of_wave.connect(end_of_wave)
	Signals.access_next_room.connect(next_room)
	Signals.restart_game.connect(restart_game)


func restart_game():
	for child in get_children():
		child.queue_free()
	add_child(_fight_room.instantiate())
	


func next_room():
	var portal = get_node("Portal")
	portal.queue_free()


func end_of_wave():
	var new_portal = _portal_scene.instantiate()
	new_portal.position = _center_position
	add_child(new_portal)
