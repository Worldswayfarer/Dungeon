extends RigidBody2D

# the base class for all entities (player, enemies)

@export var Stats : EntityStats

var Direction = Vector2.ZERO


func _physics_process(_delta):
	var speed = Stats.getStat(Enums.Stats.SPEED)
	linear_velocity = Direction * speed[0] * speed[1]


func applyDamage(damage):
	Stats.setStat(Enums.Stats.CURRENT_HEALTH, - damage)
