extends RigidBody2D

# the base class for all entities (player, enemies)

@export var Stats : EntityStats

var Direction = Vector2.ZERO


func _physics_process(_delta):
	linear_velocity = Direction * Stats.getStat(Enums.Stats.SPEED)


func applyDamage(damage):
	Stats.setStat(Enums.Stats.CURRENT_HEALTH, - damage)
