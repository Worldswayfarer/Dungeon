extends Node2D

var _parent = null

func _ready():
	_parent = get_parent()

func _process(_delta):
	handleMovement()


func handleMovement():
	var direction = Vector2.ZERO
	direction.y = 0
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	elif Input.is_action_pressed("move_down"):
		direction.y += 1
	
	direction.x = 0
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	elif Input.is_action_pressed("move_right"):
		direction.x += 1
	
	_parent._direction = direction.normalized()


func _on_timer_timeout():
	Signals.player_position_updated.emit(_parent.position)
