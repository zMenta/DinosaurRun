extends Node2D

export(float) var speed_increase_vaue := 0.2
export(float) var obstacle_spawn_rate_increase := 0.001
export(int) var points_per_timeout := 1

onready var map := $Map
onready var obstacle_manager := $ObstacleManager
onready var point_timer := $PointTimer
onready var interface := $Interface

var points := 0

func _on_SpeedIncreaseTimer_timeout():
	obstacle_manager.increase_spawn_rate(obstacle_spawn_rate_increase)
	obstacle_manager.increase_obstacles_speed(speed_increase_vaue)
	map.increase_world_speed(speed_increase_vaue)


func _on_Player_died():
	map.stop_world()
	obstacle_manager.stop_obstacles()
	point_timer.stop()


func _on_PointTimer_timeout():
	points += points_per_timeout
	interface.update_score(points)
