extends Area2D

class_name HitBoxComponent

@onready var _parent = get_parent()
@onready var _Effects = _parent.get_node_or_null(References._effect_component)

func _ready():
	_parent = get_parent()
	if _parent.has_method("handle_hitbox_entered"):
		self.area_entered.connect(_on_area_entered)
	if _parent.has_method("handle_hitbox_exited"):
		self.area_exited.connect(_on_area_exited)


func _on_area_entered(area):
	_parent.handle_hitbox_entered(area)


func _on_area_exited(area):
	_parent.handle_hitbox_exited(area)


func add_effects(effects):
	if _Effects:
		_Effects.add_effects(effects)

