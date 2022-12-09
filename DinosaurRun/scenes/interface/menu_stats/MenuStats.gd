extends Control

signal buttonMainMenu_pressed
signal buttonResetStats_pressed

onready var label_highscore:= $ColorRect/VBoxContainer/HighScore/LabelHighscoreValue
onready var label_total_score := $ColorRect/VBoxContainer/TotalScore/LabelTotalScoreValue

var save : SaveData setget set_save_data


func set_save_data(new_save: SaveData) -> void:
	save = new_save
	label_highscore.text = str(save.player_stats.highscore)
	label_total_score.text = str(save.player_stats.total_points_made)


func _on_ButtonMainMenu_pressed() -> void:
	emit_signal("buttonMainMenu_pressed")


func _on_ButtonResetStats_pressed() -> void:
	emit_signal("buttonResetStats_pressed")
