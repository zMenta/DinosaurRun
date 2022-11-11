extends Node2D

export(float) var speed_increase_vaue := 0.2
export(float) var obstacle_spawn_rate_increase := 0.002

onready var map := $Map
onready var obstacle_manager := $ObstacleManager


func _on_SpeedIncreaseTimer_timeout():
	obstacle_manager.increase_spawn_rate(obstacle_spawn_rate_increase)
	obstacle_manager.increase_obstacles_speed(speed_increase_vaue)
	map.increase_world_speed(speed_increase_vaue)
