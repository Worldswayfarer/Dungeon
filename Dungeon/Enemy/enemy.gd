extends RigidBody2D


@export var Speed = 100.0
var Direction = Vector2.ZERO


func _ready():
	Signals.Player_position_updated.connect(changeDirection)


func changeDirection(player_position):
	Direction = player_position - position
	Direction = Direction.normalized()
	

func _physics_process(_delta):
	linear_velocity = Direction * Speed


func _on_body_entered(_body):
	pass
