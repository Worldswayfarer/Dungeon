extends BaseComponent

class_name ChargerComponent

var _damage_timer : float = 0
var _max_timer :float = 2.0
var _time_to_charge : float = 6.0
var _time_to_charge_max : float = 6.0

var _charge_duration : float = 0.0
var _charge_duration_max : float = 2.0
var _is_charging : bool = false

var _effects : Array = [DamageEffect.new(5)]

var _player_position : Vector2 = Vector2.ZERO
var _target : HitBoxComponent = null

var _Movement : MovementComponentPhysics
var _Stats : StatsComponent

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.LOGIC

func _ready():
	_parent._object_type = IDS.ENEMY_CHARGER

	_Movement = get_component(Enums.ComponentTypes.MOVEMENT_PHYSICS)
	_Stats = get_component(Enums.ComponentTypes.STATS)
	Signals.player_position_updated.connect(change_direction)


func _exit_tree():
	Signals.enemy_death.emit(self)
	Signals.player_position_updated.disconnect(change_direction)


func handle_hitbox_entered(area):
	_target = area


func handle_hitbox_exited(_area):
	_target = null
	_damage_timer = 0


func _process(delta):
	_damage_timer -= delta
	_time_to_charge -= delta
	if _time_to_charge <= 0 and !_is_charging:
		charge()
	if _is_charging:
		_charge_duration -= delta
		if _charge_duration <= 0:
			stop_charging()
	if !_target:
		return
	if _damage_timer <= 0:
		_target.add_effects(_effects)
		_damage_timer = _max_timer


func charge():
	change_direction(_player_position)
	_is_charging = true
	_charge_duration = _charge_duration_max
	_Stats.change_stat(Enums.Stats.SPEED_MULTIPLIER, 4)


func stop_charging():
	_is_charging = false
	_time_to_charge = _time_to_charge_max
	_Stats.change_stat(Enums.Stats.SPEED_MULTIPLIER, 1)

func change_direction(player_position):
	_player_position = player_position
	if _is_charging:
		return
	var direction = player_position - _parent.position
	_Movement.change_direction(direction.normalized())
