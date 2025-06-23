extends BaseComponent

class_name HitBoxComponent

var _Effects : EffectComponent

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.HITBOX

func _ready():
	_Effects = get_component(Enums.ComponentTypes.EFFECT)
	if _parent.has_method("handle_hitbox_entered"):
		self.area_entered.connect(_on_area_entered)
	if _parent.has_method("handle_hitbox_exited"):
		self.area_exited.connect(_on_area_exited)


func _on_area_entered(area: HitBoxComponent):
	_parent.handle_hitbox_entered(area)


func _on_area_exited(area):
	_parent.handle_hitbox_exited(area)


func add_effects(effects):
	if _Effects:
		for effect in effects:
			effect.apply_effect(_parent)

