extends Node2D

var Parent = null

func _ready():
	Parent = get_parent()

func _process(_delta):
	handleMovement()


func handleMovement():
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	elif Input.is_action_pressed("move_down"):
		direction.y += 1
	else:
		direction.y = 0
	
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	elif Input.is_action_pressed("move_right"):
		direction.x += 1
	else:
		direction.x = 0
	
	Parent.Direction = direction.normalized()


func _on_timer_timeout():
	Signals.Player_position_updated.emit(Parent.position)
