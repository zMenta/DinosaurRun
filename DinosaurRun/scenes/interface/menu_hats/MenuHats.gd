extends Control

signal buyButton_pressed(save)
signal mainMenuButton_pressed

export(Resource) var hats_array
onready var hat_texture := $ColorRect/VBoxContainer/HBoxContainer/HatTextureRect

var save: SaveData

func _ready() -> void:
	hats_array = hats_array as Hats
	hat_texture.texture = hats_array.hats[0].texture


func _on_ButtonGoBack_pressed():
	emit_signal("mainMenuButton_pressed")


func _on_ButtonBuy_pressed():
	pass
	# emit_signal("buyButton_pressed")


func _on_ButtonNext_pressed():
	pass # Replace with function body.

func _on_ButtonPrevious_pressed():
	pass # Replace with function body.
