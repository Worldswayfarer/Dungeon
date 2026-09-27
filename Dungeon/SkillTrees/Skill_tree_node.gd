extends Node2D



var _skills : Dictionary[StringName, Skill] = {}


func get_skill(skill : StringName) -> Skill:
	return _skills[skill]


func _enter_tree():
	load_tree()


func load_tree():
	var effects : Array[Effect] = [DamageEffect.new(1)]

	var ability = Shoot.new(IDS.SPELL_BULLET)
	_skills[IDS.SPELL_BULLET] = Skill.new(IDS.SPELL_BULLET, ability, effects, 3)
	ability = Shoot.new(IDS.SPELL_SHURIKEN)
	_skills[IDS.SPELL_SHURIKEN] = Skill.new(IDS.SPELL_SHURIKEN, ability, effects, 2)
