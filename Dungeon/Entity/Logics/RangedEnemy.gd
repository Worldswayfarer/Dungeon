extends BaseComponent

class_name RangedEnemy

var _damage_timer : float = 0
var _max_timer :float = 5.0

var _shooting_distance : float = 400


var _shooter : Ability = Ability.new()

var _target : Vector2 = Vector2.ZERO
var _Movement : MovementComponentPhysics

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.LOGIC

func _ready():
	_Movement = get_component(Enums.ComponentTypes.MOVEMENT_PHYSICS)
	Signals.player_position_updated.connect(change_direction)


func _exit_tree():
	Signals.player_position_updated.disconnect(change_direction)


func _process(delta):
	_damage_timer -= delta
	if !_target:
		return
	if _damage_timer <= 0:
		_shooter.use(_parent, Enums.ObjectTypes.BULLET, _target, 0b100, 0b010)
		_damage_timer = _max_timer


func change_direction(player_position : Vector2):
	_target = player_position
	var direction = (player_position - _parent.position).normalized()
	if (player_position - _parent.position).length() < _shooting_distance:
		direction = -direction
	_Movement.change_direction(direction)
