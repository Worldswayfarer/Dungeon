extends CharacterBody2D

@warning_ignore("unused_private_class_variable")
var _type = Enums.ObjectTypes.PLAYER

func _ready():
	Signals.player_position_updated.connect(change_direction)


func _exit_tree():
	Signals.enemy_death.emit(self)


func handle_hitbox(area):
	pass


func change_direction(player_position):
	var direction = player_position - position
	get_node(References._movement_component)._direction = direction.normalized()
