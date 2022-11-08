extends Node2D
class_name Obstacle

onready var sprite := $ObstacleHitbox/Sprite
onready var collisionShape := $ObstacleHitbox/CollisionPolygon2D
export(float) var speed : float = 50

func _ready() -> void:
	randomize()
	if randi() % 2 == 0:
		sprite.flip_h = true
		collisionShape.scale.x *= -1


func _physics_process(delta: float) -> void:
	position.x -= speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
