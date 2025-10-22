class_name EncounterLoader

static func load_encounter_from_json(path: String) -> Encounter:
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Failed to open encounter file: " + path)
		return null

	var parsed = JSON.parse_string(file.get_as_text())
	if parsed == null or typeof(parsed) != TYPE_ARRAY:
		push_error("Invalid JSON format in: " + path)
		return null

	var encounter := Encounter.new()
	for entry in parsed:
		var unit := EncounterUnit.new()
		unit.type = entry.get("type", "")
		unit.count = entry.get("count", 0)
		encounter.pattern.append(unit)

	return encounter


static func load_all_encounters() -> Array[Encounter]:
	var path = "res://Data/Encounters/"
	var dir := DirAccess.open(path)
	if !dir:
		return []
	var encounters : Array[Encounter] = []
	for file_name in dir.get_files():
		var encounter = load_encounter_from_json(path + file_name)
		if encounter:
			encounters.append(encounter)
	return encounters