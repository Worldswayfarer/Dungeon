extends Node2D


# holds the main skill of every "tree"
# e.t. only holds the CAST_BULLET skill but not its upgrades
var _skills = {}


func get_skill(skill : StringName):
	return _skills[skill]


func _enter_tree():
	load_tree()


func load_tree():
	var level_1 = [DamageEffect.new(1)]
	var level_2 = [DamageEffect.new(2)]
	var level_3 = [DamageEffect.new(3)]
	var level_4 = [DamageEffect.new(4)]
	var effects = []
	var main_effect = Ability.new()
	effects.append(level_1)
	effects.append(level_2)
	effects.append(level_3)
	effects.append(level_4)
	_skills[IDS.SPELL_BULLET] = Skill.new(IDS.SPELL_BULLET,
		0, 3, true, main_effect, [], effects, [], 3)
	_skills[IDS.SPELL_SHURIKEN] = Skill.new(IDS.SPELL_SHURIKEN,
		0, 3, true, main_effect, [], effects, [], 2)
