extends Control

export(Array, String) var available_resolutions

onready var resolution_options := $ColorRect/VBoxContainer/Resolution/OptionButtonResolution


func _ready():
	for resolution in available_resolutions:
		resolution_options.add_item(resolution)


func _on_CheckBox_toggled(button_pressed:bool) -> void:
	OS.window_fullscreen = button_pressed
