extends KinematicBody2D
class_name Player

signal died

const JUMP_VELOCITY := -175
const MAX_JUMP_VELOCITY := -1100

var _gravity : float = 9.8
var _can_jump := false
var dead := false


# Movement
func _physics_process(delta: float) -> void:
	if dead:
		return


	# if not is_on_floor():
	# 	velocity.y += _gravity * delta
