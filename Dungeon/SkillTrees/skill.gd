class_name Skill

var _name

var ability : Ability = null


var _cooldown : float = 0
var _last_casted : float = - 10000

var _on_hit_effects = []


func _init(name : StringName, spell : Ability, on_hit_effects : Array[Effect], cooldown = 0):
	_name = name
	_on_hit_effects = on_hit_effects
	_cooldown = cooldown
	ability = spell



func get_on_hit_effects():
	return _on_hit_effects



func use_skill(caster):
	var current_time = Time.get_ticks_msec() / 1000.0
	if ( current_time - _last_casted) < _cooldown:
		return
	if ability != null:
		ability.use(caster)
		_last_casted = current_time
