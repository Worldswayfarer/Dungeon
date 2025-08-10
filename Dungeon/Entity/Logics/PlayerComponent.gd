extends BaseComponent

class_name PlayerComponent
var _Movement : MovementComponentPhysics
var _Abilities : AbilityComponent
var _Stats : StatsComponent

func get_component_type() -> Enums.ComponentTypes:
	return Enums.ComponentTypes.LOGIC

func _ready():
	_Movement = get_component(Enums.ComponentTypes.MOVEMENT_PHYSICS)
	_Abilities = get_component(Enums.ComponentTypes.ABILITY)
	_Stats = get_component(Enums.ComponentTypes.STATS)
	_parent.position = Vector2(1000, 500)


func _process(_delta):
	handle_movement()
	emit_player_health()

	

func emit_player_health():
	var current_health = _Stats.get_stat(Enums.Stats.CURRENT_HEALTH)
	var max_health = _Stats.get_stat(Enums.Stats.MAXIMUM_HEALTH)
	var multiplier = _Stats.get_stat(Enums.Stats.HEALTH_MULTIPLIER)
	Signals.player_health.emit(current_health * multiplier, max_health * multiplier)


func handle_movement():
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	elif Input.is_action_pressed("move_down"):
		direction.y += 1
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	elif Input.is_action_pressed("move_right"):
		direction.x += 1
	
	
	_Movement._direction = direction.normalized()
	Signals.player_position_updated.emit(_parent.position)


func shoot(skill_slot):
	_Abilities.use_slot(skill_slot)


func _input(event):
	if event.is_action_pressed("use_ability_1"):
		shoot(0)
	if event.is_action_pressed("use_ability_2"):
		shoot(1)
	
