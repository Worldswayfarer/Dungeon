extends Node2D

var _parent = null
var _factory = null


func _ready():
	_parent = get_parent()
	_parent._type = Enums.EntityTypes.PLAYER
	_factory = get_node("/root/main/ObjectFactory")


func _process(_delta):
	handle_movement()


func _exit_tree():
	Signals.player_death.emit()


func handle_movement():
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
	
	if Input.is_action_just_pressed("Shoot"):
		shoot()
	
	_parent.get_node("MovementComponent")._direction = direction.normalized()


func shoot():
	_parent.get_node("AttackComponent").attack(Enums.ObjectTypes.BULLET)


func _on_timer_timeout():
	Signals.player_position_updated.emit(_parent.position)
