extends Node2D

class_name Root

var _registered_components: Dictionary = {}

func _enter_tree():
	_register_components()


func _register_components():
	for child in get_children():
		if child is BaseComponent:
			var type : Enums.ComponentTypes = child.get_component_type()
			child._register_component(self)
			_registered_components[type] = child


func get_component(type: Enums.ComponentTypes) -> BaseComponent:
	return _registered_components.get(type)
