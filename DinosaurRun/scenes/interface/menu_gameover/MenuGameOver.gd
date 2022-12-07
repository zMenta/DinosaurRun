extends Control

signal buttonRestart_pressed
signal buttonGoBack_pressed

func _on_ButtonRestart_pressed() -> void:
	emit_signal("buttonRestart_pressed")

func _on_ButtonGoBack_pressed() -> void:
	emit_signal("buttonGoBack_pressed")
