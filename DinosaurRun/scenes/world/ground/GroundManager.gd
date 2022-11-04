extends Node2D

onready var respawn_position := $Position2D
onready var ground_group := $Grounds


func _on_Ground_screen_exited(ground: Ground) -> void:
	ground.global_position = respawn_position.global_position


func change_speed(new_value: float) -> void:
	ground_group.speed = new_value
