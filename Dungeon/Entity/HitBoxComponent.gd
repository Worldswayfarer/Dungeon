extends Area2D

class_name HitBoxComponent

var _parent
var _effects_component

func _ready():
	self.area_entered.connect(_on_area_entered)
	_parent = get_parent()
	_effects_component = _parent.get_node_or_null(References._effect_component)


func _on_area_entered(area):
	_parent.handle_hitbox(area)


func add_effects(effects):
	if _effects_component:
		_effects_component.add_effects(effects)

