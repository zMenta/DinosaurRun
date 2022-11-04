extends ParallaxBackground

func _physics_process(delta: float) -> void:
	$Layer.motion_offset.x -= 10 * delta
	$Layer2.motion_offset.x -= 20 * delta
	# offset.x -= 190 * delta
