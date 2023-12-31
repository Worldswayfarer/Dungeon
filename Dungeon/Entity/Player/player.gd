extends Node2D

var _parent = null
var _factory = null


func _ready():
	_parent = get_parent()
	_parent._type = Enums.EntityTypes.PLAYER
	_factory = get_node("/root/main/ObjectFactory")


func _process(_delta):
	handle_movement()


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
	
	_parent._direction = direction.normalized()


func shoot():
		var new_enemy = _factory.get_object_instance(Enums.ObjectTypes.BULLET)
		_factory.add_child(new_enemy)
		
		var effect = []
		effect += [DamageOverTimeEffect.new(
				DamageEffect.new(_parent._stats.get_stat(Enums.Stats.DAMAGE))
			, Enums.Effects.Bleed, 10)]
		effect += [TemporaryEffect.new(
				StatModifierEffect.new(Enums.Stats.SPEED, 0, 0.25)
			, Enums.Effects.Slow, 5)]
		
		new_enemy.setup(global_position, effect)


func _on_timer_timeout():
	Signals.player_position_updated.emit(_parent.position)
