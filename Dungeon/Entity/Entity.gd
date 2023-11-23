extends RigidBody2D

# the base class for all entities (player, enemies)

var _stats : EntityStats = EntityStats.new()

var _direction = Vector2.ZERO

func _physics_process(_delta):
	var speed = _stats.getStat(Enums.Stats.SPEED)
	linear_velocity = _direction * speed
