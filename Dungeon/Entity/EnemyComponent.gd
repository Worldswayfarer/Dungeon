extends BaseComponent

class_name EnemyComponent

var _damage_timer : float = 0
var _max_timer :float = 2
var _effects : Array = [DamageEffect.new(10)]
var _target : HitBoxComponent = null
var _Movement : MovementComponentPhysics

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.LOGIC

func _ready():
	_Movement = get_component(Enums.ComponentTypes.MOVEMENT_PHYSICS)
	Signals.player_position_updated.connect(change_direction)


func _exit_tree():
	Signals.enemy_death.emit(self)


func handle_hitbox_entered(area):
	_target = area
	_damage_timer = 0


func handle_hitbox_exited(_area):
	_target = null


func _process(delta):
	if _target:
		_damage_timer -= delta
		if _damage_timer <= 0:
			_target.add_effects(_effects)
			_damage_timer = _max_timer


func change_direction(player_position):
	var direction = player_position - _parent.position
	_Movement.change_direction(direction.normalized())
