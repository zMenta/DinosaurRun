extends AnimatedSprite

export(String) var animation_name : String = "default"

func _ready() -> void:
	randomize()
	frame = randi() % frames.get_frame_count(animation_name)

	if randi() % 2 == 0:
		flip_h = true


func _on_VisibilityNotifier2D_screen_exited() -> void:
	# queue_free()
	pass
