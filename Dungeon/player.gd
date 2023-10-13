extends Node2D

@export var _speed: float = 200.0

func _process(delta):
	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	
	direction.normalized()
	
	position += direction * _speed * delta
