class_name SaveData
extends Resource

const SAVE_GAME_PATH := "user://save.tres"


export var player_stats: Resource
# export var game_settings: Resource


func write_savegame() -> void:
	ResourceSaver.save(SAVE_GAME_PATH, self)


static func save_exist() -> bool:
	return ResourceLoader.exists(SAVE_GAME_PATH)


static func load_savegame() -> Resource:
	return ResourceLoader.load(SAVE_GAME_PATH, "", true)
