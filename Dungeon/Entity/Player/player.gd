extends CharacterBody2D


@onready var _Movement = get_node(References._movement_component_physics)
@onready var _Abilities = get_node(References._ability_component)

func _process(_delta):
	handle_movement()


func _exit_tree():
	Signals.player_death.emit()


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


func shoot(skill_slot):
	_Abilities.use_slot(skill_slot)


func _input(event):
	if event.is_action_pressed("use_ability_1"):
		shoot(0)
	if event.is_action_pressed("use_ability_2"):
		shoot(1)


func _on_timer_timeout():
	Signals.player_position_updated.emit(position)
