extends Control

signal buttonMainMenu_pressed

onready var resolution_options_button := $ColorRect/VBoxContainer/Resolution/OptionButtonResolution

var resolutions: Dictionary = {
	"1920x1080": Vector2(1920, 1080),
	"1366x768": Vector2(1366, 768),
	"1280x720": Vector2(1280, 720),
	"1024x600": Vector2(1024, 600),
	}


func _ready():
	for resolution in resolutions:
		resolution_options_button.add_item(resolution)


func _on_CheckBox_toggled(button_pressed:bool) -> void:
	OS.window_fullscreen = button_pressed


func _on_CheckBoxBordless_toggled(button_pressed:bool) -> void:
	OS.window_borderless = button_pressed


func _on_OptionButtonResolution_item_selected(index:int) -> void:
	var window_size: Vector2 = resolutions[resolution_options_button.get_item_text(index)]
	OS.set_window_size(window_size)


func _on_ButtonMainMenu_pressed() -> void:
	emit_signal("buttonMainMenu_pressed")
