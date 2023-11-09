extends RigidBody2D

# the base class for all entities (player, enemies)

@export var Stats : EntityStats

var Direction = Vector2.ZERO
var OnHitEffects = []

func _physics_process(_delta):
	var speed = Stats.getStat(Enums.Stats.SPEED)
	linear_velocity = Direction * speed[0] * speed[1]


func applyDamage(damage):
	if damage == 0: return
	if Enums.Stats.CURRENT_HEALTH - damage <=0: death()
	Stats.addStat(Enums.Stats.CURRENT_HEALTH, damage)


func death():
	pass
