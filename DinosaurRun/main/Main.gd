extends Node2D

export(float) var speed_increase_value := 0.2
export(float) var obstacle_spawn_rate_increase := 0.001
export(int) var points_per_timeout := 1

onready var player := $Player
onready var map := $Map
onready var obstacle_manager := $ObstacleManager
onready var point_timer := $PointTimer
onready var speed_increase_timer := $SpeedIncreaseTimer
onready var interface := $Interfaces/Interface
onready var menu_main := $Interfaces/MenuMain
onready var menu_gameover := $Interfaces/MenuGameOver
onready var menu_options := $Interfaces/MenuOptions

var _save: SaveData
var points := 0
var highscore := 0 setget set_highscore
var total_points_made := 0


func _ready() -> void:
	_create_or_load_save()


func _create_or_load_save() -> void:
	if SaveData.save_exist():
		_save = SaveData.load_savegame() as SaveData
	else:
		_save = SaveData.new()
		_save.player_stats = PlayerStats.new()
		_save.write_savegame()

	set_highscore(_save.player_stats.highscore)


func _save_game() -> void:
	_save.player_stats.highscore = highscore
	_save.player_stats.total_points_made = total_points_made
	_save.write_savegame()


func _start_game() -> void:
	points = 0
	point_timer.start()
	speed_increase_timer.start()
	interface.visible = true
	menu_main.visible = false
	obstacle_manager.start_obstacles()


func _validade_highscore(points_made: int) -> void:
	if points_made > highscore:
		highscore = points_made


func set_highscore(new_value: int) -> void:
	highscore = new_value
	menu_main.set_highscore_label(highscore)


func _on_Player_died():
	map.stop_world()
	obstacle_manager.stop_obstacles()
	point_timer.stop()
	menu_gameover.set_label_score(points)
	menu_gameover.visible = true
	total_points_made += points
	_validade_highscore(points)
	_save_game()



func _on_SpeedIncreaseTimer_timeout():
	obstacle_manager.increase_spawn_rate(obstacle_spawn_rate_increase)
	obstacle_manager.increase_obstacles_speed(speed_increase_value)
	map.increase_world_speed(speed_increase_value)


func _on_PointTimer_timeout():
	points += points_per_timeout
	interface.update_score(points)


func _on_MenuMain_buttonPlay_pressed() -> void:
	_start_game()


func _on_MenuMain_buttonExit_pressed() -> void:
	get_tree().quit()


func _on_MenuGameOver_buttonRestart_pressed() -> void:
	menu_gameover.visible = false
	obstacle_manager.restart_obstacles()
	map.restart_world()
	_start_game()
	player.revive_player()
	

func _on_MenuGameOver_buttonGoBack_pressed() -> void:
	get_tree().reload_current_scene()


func _on_MenuMain_buttonSettings_pressed() -> void:
	menu_main.visible = false
	menu_options.visible = true


func _on_MenuOptions_buttonMainMenu_pressed() -> void:
	menu_main.visible = true
	menu_options.visible = false
