extends Node2D

export(PackedScene) var obstacle_small
export(PackedScene) var obstacle_big
export(int) var base_obstacle_speed := 120
export(float) var min_spawn_time := 1.2

onready var spawn_timer := $SpawnTimer
onready var spawn_position := $SpawnPosition
onready var obstacles := [obstacle_small, obstacle_big]
onready var obstacles_group := $ObstaclesGroup


func increase_spawn_rate(value: float) -> void:
	if not spawn_timer.wait_time <= 0 and spawn_timer.wait_time >= min_spawn_time:
		spawn_timer.wait_time -= value


func increase_obstacles_speed(speed_increase: float) -> void:
	base_obstacle_speed += speed_increase
	for obstacle in obstacles_group.get_children():
		obstacle.speed = base_obstacle_speed


func _on_SpawnTimer_timeout():
	randomize()
	var obstacle = obstacles[randi() % obstacles.size()]
	obstacle = obstacle.instance()
	
	obstacle.speed = base_obstacle_speed
	obstacle.global_position = spawn_position.global_position
	obstacles_group.add_child(obstacle)
