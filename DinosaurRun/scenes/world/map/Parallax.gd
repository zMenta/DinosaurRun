extends Node2D

onready var parallax_background := $ParallaxBackground


func increase_layers_speed(speed_increase: float) -> void:
	for layer in parallax_background.get_children():
		if layer.get_script() != null:
			layer.current_speed += speed_increase


func stop_layers() -> void:
	for layer in parallax_background.get_children():
		if layer.get_script() != null:
			layer.is_moving = false


func start_layers() -> void:
	for layer in parallax_background.get_children():
		if layer.get_script() != null:
			layer.is_moving = true


func restore_layers() -> void:
	for layer in parallax_background.get_children():
		if layer.get_script() != null:
			layer.restore_default_speed()
