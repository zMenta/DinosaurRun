extends Node2D

onready var respawn_position := $Position2D
onready var ground_group := $Grounds

export var speed : float = 50


func _ready() -> void:
	change_ground_speed(speed)


func change_ground_speed(new_value: float) -> void:
	ground_group.speed = new_value


func _on_Ground_screen_exited(ground: Ground) -> void:
	ground.global_position = respawn_position.global_position
