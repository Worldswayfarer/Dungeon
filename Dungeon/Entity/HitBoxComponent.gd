extends Area2D

class_name HitBoxComponent

var _parent
var _incoming_effects = []

func _ready():
	area_entered.connect(_on_area_entered)
	_parent = get_parent()


func _on_area_entered(area):
	_parent.handle_hitbox(area)

