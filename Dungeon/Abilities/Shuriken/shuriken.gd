extends BaseComponent

class_name SHURIKEN


var _direction : Vector2
var _duration = 2.
var _effects : Array = []
var _hit_box : HitBoxComponent
var _Movement : MovementComponent

var _isReturning = false
var _spinning_speed = 15

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.LOGIC


func setup(new_position, target_position, effects : Array = [], layer = 0b100):
	_effects = effects

	_hit_box = get_component(Enums.ComponentTypes.HITBOX)
	_hit_box.collision_layer = layer

	_Movement = get_component(Enums.ComponentTypes.MOVEMENT)
	_parent.position = new_position
	_direction = target_position - _parent.position
	_parent.rotation = _direction.angle()
	_Movement.change_direction(_direction.normalized())

	


func _process(delta):
	if _duration <= 0 and !_isReturning:
		handle_returning()
	_duration -= delta
	_parent.rotate(_spinning_speed * delta)


func handle_hitbox_entered(area):
	if area.get_type() == Enums.ObjectTypes.PLAYER:
		_parent.queue_free()
		return
	area.add_effects(_effects)


func handle_returning():
	_isReturning = true
	_hit_box.collision_mask = 0b110
	Signals.player_position_updated.connect(change_direction)


func change_direction(player_position):
	var direction = player_position - _parent.position
	_Movement.change_direction(direction.normalized())
