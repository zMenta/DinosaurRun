extends ParallaxLayer

export(float) var speed : float = 50
export(bool) var is_moving : bool = true

func _physics_process(delta: float) -> void:
	if not is_moving:
		return
	
	motion_offset.x -= speed * delta
