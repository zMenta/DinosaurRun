extends ParallaxLayer

export(float) var speed : float = 50
export(bool) var is_moving : bool = true

onready var current_speed := speed

func _physics_process(delta: float) -> void:
	if not is_moving:
		return
	
	motion_offset.x -= current_speed * delta


func restore_default_speed() -> void:
	current_speed = speed
