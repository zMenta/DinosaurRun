extends Node2D

onready var parallax_background := $ParallaxBackground


func increase_layers_speed(speed_increase: float) -> void:
	for layer in parallax_background.get_children():
		if layer.get_script() != null:
			layer.speed += speed_increase
	
