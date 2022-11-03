extends AnimatedSprite


func _ready() -> void:
	randomize()
	frame = randi() % frames.get_frame_count("default")
