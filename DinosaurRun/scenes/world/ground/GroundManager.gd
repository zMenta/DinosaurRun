extends Node2D

onready var respawn_position := $Position2D


func _on_Ground_screen_exited(ground: Ground) -> void:
	print(str(ground) + " | respawned")
	ground.global_position = respawn_position.global_position
