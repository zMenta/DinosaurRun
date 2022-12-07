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

var points := 0


func _start_game() -> void:
	points = 0
	point_timer.start()
	speed_increase_timer.start()
	interface.visible = true
	menu_main.visible = false
	obstacle_manager.start_obstacles()


func _on_SpeedIncreaseTimer_timeout():
	obstacle_manager.increase_spawn_rate(obstacle_spawn_rate_increase)
	obstacle_manager.increase_obstacles_speed(speed_increase_value)
	map.increase_world_speed(speed_increase_value)


func _on_Player_died():
	map.stop_world()
	obstacle_manager.stop_obstacles()
	point_timer.stop()
	menu_gameover.score_value = points
	menu_gameover.visible = true


func _on_PointTimer_timeout():
	points += points_per_timeout
	interface.update_score(points)


func _on_MenuMain_buttonPlay_pressed() -> void:
	_start_game()


func _on_MenuMain_buttonExit_pressed() -> void:
	get_tree().quit()


func _on_MenuGameOver_buttonRestart_pressed() -> void:
	menu_gameover.visible = false
	map.restart_world()
	_start_game()
	player.revive_player()
	

func _on_MenuGameOver_buttonGoBack_pressed() -> void:
	get_tree().reload_current_scene()
	
