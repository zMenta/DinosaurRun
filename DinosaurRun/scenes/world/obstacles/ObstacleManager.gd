extends Node2D

export(PackedScene) var obstacle_small
export(PackedScene) var obstacle_big

onready var spawn_timer := $SpawnTimer
onready var spawn_position := $SpawnPosition
onready var obstacles := [obstacle_small, obstacle_big]


func _on_SpawnTimer_timeout():
	randomize()
	var obstacle = obstacles[randi() % obstacles.size()]
	obstacle = obstacle.instance()
	
	obstacle.global_position = spawn_position.global_position
	add_child(obstacle)
