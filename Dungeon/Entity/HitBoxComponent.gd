extends BaseComponent

class_name HitBoxComponent

var _Effects : EffectComponent
var _Logic = null

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.HITBOX

func _ready():
	_Effects = get_component(Enums.ComponentTypes.EFFECT)
	_Logic = get_component(Enums.ComponentTypes.LOGIC)
	if !_Logic:
		return
	if _Logic.has_method("handle_hitbox_entered"):
		self.area_entered.connect(_on_area_entered)
	if _Logic.has_method("handle_hitbox_exited"):
		self.area_exited.connect(_on_area_exited)


func _on_area_entered(area: HitBoxComponent):
	_Logic.handle_hitbox_entered(area)


func _on_area_exited(area):
	_Logic.handle_hitbox_exited(area)


func add_effects(effects):
	if _Effects:
		for effect in effects:
			effect.apply_effect(_parent)
