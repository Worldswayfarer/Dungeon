extends BaseComponent

class_name BULLET


var _direction : Vector2
var _duration = 4.
var _effects : Array = []
var _hit_box : HitBoxComponent
var _movement_component : MovementComponent

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.LOGIC


func setup(new_position, target_position, effects : Array = [], layer = 0b100):
	_effects = effects
	_hit_box = get_component(Enums.ComponentTypes.HITBOX)
	_movement_component = get_component(Enums.ComponentTypes.MOVEMENT)

	_hit_box.collision_layer = layer
	position = new_position
	_direction = target_position - position
	rotation = _direction.angle()
	_movement_component._direction = _direction.normalized()


func _process(delta):
	if _duration <= 0:
		self.queue_free()
	_duration -= delta


func handle_hitbox_entered(area):
	area.add_effects(_effects)
