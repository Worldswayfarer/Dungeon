extends Node

# Nodes
@warning_ignore("unused_private_class_variable")
@onready var _factory = get_node("/root/main/ObjectFactory")
@warning_ignore("unused_private_class_variable")
@onready var _room = get_node("/root/main/Room")
@warning_ignore("unused_private_class_variable")
@onready var _skill_tree = get_node("/root/main/SkillTree")

# Scenes
@warning_ignore("unused_private_class_variable")
var _portal = preload("res://Core/RoomManagement/portal.tscn")
