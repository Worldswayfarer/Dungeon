
extends Node2D


var _portal_scene = References._portal
var _center_position = Vector2(960, 540)

func _ready():
	Signals.end_of_wave.connect(end_of_wave)


func end_of_wave():
	cleanup()
	var new_portal = _portal_scene.instantiate()
	new_portal.position = _center_position
	add_child(new_portal)


func cleanup():
	for child in get_children():
		remove_child(child)
		child.queue_free()
