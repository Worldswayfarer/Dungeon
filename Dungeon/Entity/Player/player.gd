extends Node2D

var _parent = null
var _bullet_scene = preload("res://Bullet.tscn")
var _object_controller = null


func _ready():
	_parent = get_parent()
	_object_controller = get_parent().get_parent()


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
		var new_enemy = _bullet_scene.instantiate()
		_object_controller.add_child(new_enemy)
		var effect = []
		effect += [DamageEffect.new(_parent._stats.get_stat(Enums.Stats.DAMAGE))]
		effect += [StatModifierEffect.new(Enums.Stats.SPEED, 0, 0.1)]
		new_enemy.setup(global_position, effect)


func _on_timer_timeout():
	Signals.player_position_updated.emit(_parent.position)
