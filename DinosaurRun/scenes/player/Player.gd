extends KinematicBody2D
class_name Player

signal died

const JUMP_VELOCITY := -100
const MAX_JUMP_VELOCITY := -300

onready var animation := $AnimationPlayer

var _gravity : float = 9.8
var _gravity_multiplier := 100
var _can_jump := true
var dead := false
var velocity := Vector2()


# Movement
func _physics_process(delta: float) -> void:
	if dead:
		return

	# Jumping code, the jump will be higher if the jump key be held for longer.
	if not is_on_floor():
		velocity.y += _gravity * _gravity_multiplier * delta
	else:
		_gravity_multiplier = 100
		_can_jump = true

	if Input.is_action_pressed("jump") and _can_jump:
			velocity.y += JUMP_VELOCITY
			if velocity.y < MAX_JUMP_VELOCITY:
				_can_jump = false

	if Input.is_action_just_released("jump"):
		_gravity_multiplier = 200
		_can_jump = false

	velocity = move_and_slide(velocity, Vector2.UP)


func death() -> void:
	# 3.14 radians = 180 degrees
	rotation = 3.14
	dead = true
	emit_signal("died")
	animation.stop()


func revive() -> void:
	rotation = 0
	dead = false
	animation.play("running")


func _on_HitBox_area_entered(area:Area2D) -> void:
	if area.name == "ObstacleHitbox":
		death()
