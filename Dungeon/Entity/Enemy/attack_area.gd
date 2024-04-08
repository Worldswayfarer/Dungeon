extends Area2D

var _parent
var _damage_timer : float = 0
var _max_timer :float = 0.5
var _attacking : bool = false
var _target


func _ready():
	_parent = get_parent()


func _process(delta):
	if _attacking:
		_damage_timer -= delta
		if _damage_timer <= 0:
			deal_damage()
			_damage_timer = _max_timer


func deal_damage():
	if _target == null:
		return
	var stats = _parent.get_node(References._stats_component)._stats
	var damage = stats[Enums.Stats.DAMAGE] * stats[Enums.Stats.DAMAGEMULTIPLIER]
	_target.get_node(References._effect_component)._incoming_effects += [DamageEffect.new(damage)]


func _on_body_entered(body):
	_target = body
	_damage_timer = _max_timer
	_attacking = true
	deal_damage()


func _on_body_exited(_body):
	_target = null
	_attacking = false
