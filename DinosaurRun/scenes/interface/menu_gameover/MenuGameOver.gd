extends Control

signal buttonRestart_pressed
signal buttonGoBack_pressed

onready var label_score_value := $ColorRect/HBoxContainer/LabelScoreValue

var score_value := 0 setget _set_score_value

func _set_score_value(new_value: int) -> void:
	score_value = new_value
	label_score_value.text = str(score_value)

func _on_ButtonRestart_pressed() -> void:
	emit_signal("buttonRestart_pressed")

func _on_ButtonGoBack_pressed() -> void:
	emit_signal("buttonGoBack_pressed")
