extends Node2D

export(PackedScene) var obstacle_small
export(PackedScene) var obstacle_big
export(float) var base_obstacle_speed := 120.0
export(float) var min_spawn_time := 1.2

onready var spawn_timer := $SpawnTimer
onready var spawn_position := $SpawnPosition
onready var obstacles := [obstacle_small, obstacle_big]
onready var obstacles_group := $ObstaclesGroup

onready var current_speed := base_obstacle_speed


func increase_spawn_rate(value: float) -> void:
	if not spawn_timer.wait_time <= 0 and spawn_timer.wait_time >= min_spawn_time:
		spawn_timer.wait_time -= value


func increase_obstacles_speed(speed_increase: float) -> void:
	current_speed += speed_increase
	for obstacle in obstacles_group.get_children():
		obstacle.speed = current_speed


func restart_obstacles() -> void:
	clear_obstacles()
	current_speed = base_obstacle_speed
	start_obstacles()


func clear_obstacles() -> void:
	for obstacle in obstacles_group.get_children():
		obstacle.queue_free()


func stop_obstacles() -> void:
	spawn_timer.stop()
	for obstacle in obstacles_group.get_children():
		obstacle.is_moving = false
		

func start_obstacles() -> void:
	spawn_timer.start()
	for obstacle in obstacles_group.get_children():
		obstacle.is_moving = true
		
		
func _on_SpawnTimer_timeout():
	randomize()
	var obstacle = obstacles[randi() % obstacles.size()]
	obstacle = obstacle.instance()
	
	obstacle.speed = base_obstacle_speed
	obstacle.global_position = spawn_position.global_position
	obstacles_group.add_child(obstacle)
