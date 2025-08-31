extends Node

# Nodes

@onready var factory = get_node("/root/main/ObjectFactory")
@onready var room = get_node("/root/main/Room")
@onready var skill_tree = get_node("/root/main/SkillTree")

# Scenes
var portal = preload("res://Core/RoomManagement/portal.tscn")
var fight_room = preload("res://Core/RoomManagement/fight_room.tscn")
