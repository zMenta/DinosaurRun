extends Control

signal buttonRestart_pressed
signal buttonGoBack_pressed

onready var label_score_value := $ColorRect/HBoxContainer/LabelScoreValue

func set_label_score(score_value: int) -> void:
	label_score_value.text = str(score_value)


func _on_ButtonRestart_pressed() -> void:
	emit_signal("buttonRestart_pressed")


func _on_ButtonGoBack_pressed() -> void:
	emit_signal("buttonGoBack_pressed")
