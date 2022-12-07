extends Control

signal buttonPlay_pressed
signal buttonSettings_pressed   
signal buttonStats_pressed   
signal buttonExit_pressed   


func _on_ButtonPlay_pressed() -> void:
	emit_signal("buttonPlay_pressed")


func _on_ButtonSettings_pressed() -> void:
	emit_signal("buttonSettings_pressed")


func _on_ButtonStats_pressed() -> void:
	emit_signal("buttonStats_pressed")


func _on_ButtonExit_pressed() -> void:
	emit_signal("buttonExit_pressed")
