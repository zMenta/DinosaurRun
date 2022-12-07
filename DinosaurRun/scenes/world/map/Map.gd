extends Node2D

onready var parallax := $Parallax

func increase_world_speed(speed_increase: float) -> void:
	parallax.increase_layers_speed(speed_increase)

func restart_world() -> void:
	parallax.restore_layers()
	start_world()

func stop_world() -> void:
	parallax.stop_layers()
	
		
func start_world() -> void:
	parallax.start_layers() 
