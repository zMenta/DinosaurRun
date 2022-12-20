extends Control

signal buttonRestart_pressed
signal buttonGoBack_pressed

onready var label_score_value := $ColorRect/HBoxContainer/LabelScoreValue
onready var label_coin_container := $ColorRect/HBoxContainer2/CoinContainer


func set_label_score(score_value: int) -> void:
	label_score_value.text = str(score_value)


func set_label_coin(coin_value: int) -> void:
	label_coin_container.set_coin_value(coin_value)


func _on_ButtonRestart_pressed() -> void:
	emit_signal("buttonRestart_pressed")


func _on_ButtonGoBack_pressed() -> void:
	emit_signal("buttonGoBack_pressed")
