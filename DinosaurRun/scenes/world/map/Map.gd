extends Node2D

onready var parallax := $Parallax

func increase_world_speed(speed_increase: float) -> void:
	parallax.increase_layers_speed(speed_increase)
