extends CharacterBody2D

@warning_ignore("unused_private_class_variable")
var _type = Enums.ObjectTypes.PLAYER

func handle_hitbox(area):
	pass


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
	
	
	get_node(References._movement_component_physics)._direction = direction.normalized()


func shoot(skill_slot):
	get_node(References._ability_component).use_slot(skill_slot)


func _input(event):
	if event.is_action_pressed("use_ability_1"):
		shoot(0)
	if event.is_action_pressed("use_ability_2"):
		shoot(1)


func _on_timer_timeout():
	Signals.player_position_updated.emit(position)
