extends Node2D
class_name BaseProp

export(float) var speed : float = 50


func _physics_process(delta: float) -> void:
	position.x -= speed * delta
