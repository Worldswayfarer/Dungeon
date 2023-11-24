extends CharacterBody2D

# the base class for all entities (player, enemies)

var _stats : EntityStats = EntityStats.new()

var _incoming_effects = []

var _direction = Vector2.ZERO

func _physics_process(delta):
	var speed = _stats.get_stat(Enums.Stats.SPEED)
	move_and_collide(_direction*speed * delta)


func _process(_delta):
	for effect in _incoming_effects:
		get_node("HealthComponent").apply_damage(effect._damage)
	_incoming_effects = []
