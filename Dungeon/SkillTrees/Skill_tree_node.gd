extends Node2D

var _skill_tree : SkillTree


func _ready():
	var effects = [DamageEffect.new(1)]
	effects += [DamageEffect.new(2)]
	effects += [DamageEffect.new(3)]
	effects += [DamageEffect.new(4)]
	var skills = Skill.new(Enums.Abilities.CAST_BULLET, 0, 3, effects)
	var tree = {}
	tree[Enums.Abilities.CAST_BULLET] = skills
	_skill_tree = SkillTree.new(tree)


func _process(delta):
	var skill = _skill_tree.get_skill_effects(Enums.Abilities.CAST_BULLET)
	print(skill)
