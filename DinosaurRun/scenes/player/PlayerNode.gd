extends Node2D

signal player_died


func _on_Player_died():
	emit_signal("player_died")
