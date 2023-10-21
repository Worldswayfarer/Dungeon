extends RigidBody2D

@export var Speed: float = 400.0
@export var Direction: Vector2 = Vector2.ZERO


func _process(_delta):
	handleMovement()


func _physics_process(_delta):
	linear_velocity = Direction * Speed


func handleMovement():
	if Input.is_action_pressed("move_up"):
		Direction.y -= 1
	elif Input.is_action_pressed("move_down"):
		Direction.y += 1
	else:
		Direction.y = 0
	
	
	if Input.is_action_pressed("move_left"):
		Direction.x -= 1
	elif Input.is_action_pressed("move_right"):
		Direction.x += 1
	else:
		Direction.x = 0
	
	Direction = Direction.normalized()


func handleAbility():
	if Input.is_action_just_pressed("UseAbility1"):
		pass


func _on_timer_timeout():
	Signals.Player_position_updated.emit(position)
