extends Node2D
class_name UpgradeSystem


var _upgrades : Array[Upgrade] = []

func _ready():
	_upgrades = load_upgrades()


static func load_upgrades() -> Array[Upgrade]:
	var path : String = "res://Data/Upgrades/first.json/"
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Failed to open encounter file: " + path)
		return []

	var parsed = JSON.parse_string(file.get_as_text())
	if parsed == null or typeof(parsed) != TYPE_ARRAY:
		push_error("Invalid JSON format in: " + path)
		return []

	var upgrades = []
	for entry in parsed:
		var upgrade := Upgrade.new()
		upgrade.ability_name = entry.get("ability_name", "")
		upgrades.append(upgrade)

	return upgrades
