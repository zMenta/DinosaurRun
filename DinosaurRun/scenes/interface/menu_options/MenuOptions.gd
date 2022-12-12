extends Control

signal buttonMainMenu_pressed
signal game_settings_saved(save)

onready var resolution_options_button := $ColorRect/VBoxContainer/Resolution/OptionButtonResolution
onready var button_fullscreen := $ColorRect/VBoxContainer/FullScreen/CheckBox
onready var button_borderless := $ColorRect/VBoxContainer/Borderless/CheckBoxBordless

var save: SaveData setget set_save_data

var resolutions: Dictionary = {
	"1920x1080": Vector2(1920, 1080),
	"1366x768": Vector2(1366, 768),
	"1280x720": Vector2(1280, 720),
	"1024x600": Vector2(1024, 600),
	}


func set_save_data(new_save: SaveData) -> void:
	save = new_save
	
	_on_CheckBox_toggled(save.game_settings.fullscreen)
	button_fullscreen.pressed = save.game_settings.fullscreen

	_on_CheckBoxBordless_toggled(save.game_settings.borderless)
	button_borderless.pressed = save.game_settings.borderless

	_on_OptionButtonResolution_item_selected(save.game_settings.screen_resolution_id)
	resolution_options_button.text = resolution_options_button.get_item_text(save.game_settings.screen_resolution_id)


func _ready():
	for resolution in resolutions:
		resolution_options_button.add_item(resolution)


func _on_CheckBox_toggled(button_pressed:bool) -> void:
	OS.window_fullscreen = button_pressed
	save.game_settings.fullscreen = button_pressed


func _on_CheckBoxBordless_toggled(button_pressed:bool) -> void:
	OS.window_borderless = button_pressed
	save.game_settings.borderless = button_pressed


func _on_OptionButtonResolution_item_selected(index:int) -> void:
	var window_size: Vector2 = resolutions[resolution_options_button.get_item_text(index)]
	OS.set_window_size(window_size)
	
	save.game_settings.screen_resolution_id = index

func _on_ButtonMainMenu_pressed() -> void:
	emit_signal("buttonMainMenu_pressed")
	emit_signal("game_settings_saved", save)
