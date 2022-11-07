extends Node
class_name Obstacle

onready var sprite := $ObstacleHitbox/Sprite
onready var collisionShape := $ObstacleHitbox/CollisionPolygon2D

func _ready() -> void:
	randomize()
	if randi() % 2 == 0:
		sprite.flip_h = true
		collisionShape.scale.x *= -1


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
