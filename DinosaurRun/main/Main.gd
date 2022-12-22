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
onready var menu_stats := $Interfaces/MenuStats
onready var menu_hats := $Interfaces/MenuHats

var _save : SaveData
var points := 0
var highscore := 0 setget set_highscore
var total_points_made := 0
var total_coins := 0 setget set_total_coins
var current_coins := 0


func _ready() -> void:
	GlobalSignals.connect("coin_obtained", self, "_on_Coin_obtained")
	_create_or_load_save()


func _create_or_load_save() -> void:
	if SaveData.save_exist():
		_save = SaveData.load_savegame() as SaveData
	else:
		_save = SaveData.new()
		_save.player_stats = PlayerStats.new()
		_save.game_settings = GameSettings.new()
		_save.write_savegame()

	set_highscore(_save.player_stats.highscore)
	set_total_coins(_save.player_stats.total_coins)
	player.current_hat_index = _save.player_stats.current_hat_index
	total_points_made = _save.player_stats.total_points_made
	menu_stats.save = _save
	menu_options.save = _save
	menu_hats.save = _save


func _save_game() -> void:
	_save.player_stats.highscore = highscore
	_save.player_stats.total_points_made = total_points_made
	_save.player_stats.total_coins = total_coins
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


func set_total_coins(new_value: int) -> void:
	total_coins = new_value
	menu_main.set_coins_label(total_coins)


func _on_Player_died():
	map.stop_world()
	obstacle_manager.stop_obstacles()
	point_timer.stop()
	menu_gameover.set_label_coin(current_coins)
	menu_gameover.set_label_score(points)
	menu_gameover.visible = true
	set_total_coins(total_coins + current_coins)
	current_coins = 0
	total_points_made += points
	_validade_highscore(points)
	_save_game()


func _on_Coin_obtained() -> void:
	current_coins += 1
	interface.update_coin(current_coins)


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
	interface.update_coin(current_coins)
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


func _on_MenuMain_buttonStats_pressed() -> void:
	menu_main.visible = false
	menu_stats.visible = true


func _on_MenuStats_buttonMainMenu_pressed() -> void:
	menu_stats.visible = false
	menu_main.visible = true


func _on_MenuStats_buttonResetStats_pressed() -> void:
	_save = SaveData.new()
	_save.player_stats = PlayerStats.new()
	_save.write_savegame()

	set_highscore(_save.player_stats.highscore)
	total_points_made = _save.player_stats.total_points_made
	menu_stats.save = _save


func _on_MenuOptions_game_settings_saved(save_settings: SaveData) -> void:
	_save.game_settings = save_settings.game_settings
	_save_game()


func _on_MenuMain_buttonShop_pressed():
	menu_main.visible = false
	menu_hats.visible = true


func _on_MenuHats_mainMenuButton_pressed():
	menu_main.visible = true
	menu_hats.visible = false
