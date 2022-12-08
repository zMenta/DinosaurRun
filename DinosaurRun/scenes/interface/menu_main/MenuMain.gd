extends Control

signal buttonPlay_pressed
signal buttonSettings_pressed   
signal buttonStats_pressed   
signal buttonExit_pressed   

onready var highcsore_label := $ColorRect/HBoxContainer/LabelHighscoreValue


func set_highscore_label(highscore_value: int) -> void:
	highcsore_label.text = str(highscore_value)


func _on_ButtonPlay_pressed() -> void:
	emit_signal("buttonPlay_pressed")


func _on_ButtonSettings_pressed() -> void:
	emit_signal("buttonSettings_pressed")


func _on_ButtonStats_pressed() -> void:
	emit_signal("buttonStats_pressed")


func _on_ButtonExit_pressed() -> void:
	emit_signal("buttonExit_pressed")
