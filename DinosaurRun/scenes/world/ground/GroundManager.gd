extends Node2D

onready var respawn_position := $Position2D


func _on_Ground_screen_exited(ground: Ground) -> void:
	ground.global_position = respawn_position.global_position
