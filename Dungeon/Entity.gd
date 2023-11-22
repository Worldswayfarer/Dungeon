extends RigidBody2D

# the base class for all entities (player, enemies)

var Stats : EntityStats = EntityStats.new()

var _direction = Vector2.ZERO

func _physics_process(_delta):
	var speed = Stats.getStat(Enums.Stats.SPEED)
	linear_velocity = _direction * speed


func apply_damage(damage):
	if damage == 0: return
	if Enums.Stats.CURRENT_HEALTH - damage <=0: death()
	Stats.addStat(Enums.Stats.CURRENT_HEALTH, damage)


func death():
	pass
