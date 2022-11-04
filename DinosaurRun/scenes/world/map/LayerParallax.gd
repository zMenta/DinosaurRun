extends ParallaxLayer

export(float) var speed : float = 50

func _physics_process(delta: float) -> void:
	motion_offset.x -= speed * delta
