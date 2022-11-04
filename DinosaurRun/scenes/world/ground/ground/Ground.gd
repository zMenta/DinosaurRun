extends StaticBody2D

signal screen_exited(ground)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	emit_signal("screen_exited", self)
