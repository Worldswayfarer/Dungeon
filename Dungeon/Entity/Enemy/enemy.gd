extends CharacterBody2D

var _damage_timer : float = 0
var _max_timer :float = 0.5
var _effects : Array = [DamageEffect.new(10)]
var _target = null
@onready var _Movement = get_node(References._movement_component_physics)

func _ready():
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
	var direction = player_position - position
	_Movement._direction = direction.normalized()
