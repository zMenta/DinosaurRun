extends BaseProp

onready var sprite := $Sprite

func _ready() -> void:
	sprite.flip_h = true
	# randomize()
	# if randi() % 2 == 0:
	# 	sprite.flip_h = true
