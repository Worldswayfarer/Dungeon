extends Node2D

class_name BaseComponent

var _parent : Root 

func _register_component(_owner : Root):
	_parent = _owner


func get_component(type : Enums.ComponentTypes) -> BaseComponent:
	return _parent.get_component(type)

func get_type() -> Enums.ObjectTypes:
	return _parent.get_type()

# Should be overwritten in child class
func get_component_type() -> Enums.ComponentTypes:
	push_error("Class must implement get_component()")
	return Enums.ComponentTypes.BASE
