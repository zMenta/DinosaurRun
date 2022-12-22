extends Control

signal buyButton_pressed(save)
signal mainMenuButton_pressed

export(Resource) var hats_resource
onready var hat_texture := $ColorRect/VBoxContainer/HBoxContainer/HatTextureRect
onready var hat_price_label := $ColorRect/VBoxContainer/HBoxContainer2/PriceValue

var save: SaveData setget set_save_data
var hat_index: int = 0


func _ready() -> void:
	hats_resource = hats_resource as Hats


func set_save_data(new_save: SaveData) -> void:
	save = new_save
	hat_index = save.player_stats.current_hat_index
	_set_hat_texture(hat_index)


func _on_ButtonGoBack_pressed():
	emit_signal("mainMenuButton_pressed")


func _on_ButtonBuy_pressed():
	pass
	# emit_signal("buyButton_pressed")


func _on_ButtonNext_pressed():
	if hat_index >= hats_resource.hats.size() - 1:
		return

	hat_index += 1
	_set_hat_texture(hat_index)


func _on_ButtonPrevious_pressed():
	if hat_index <= 0:
		return

	hat_index -= 1
	_set_hat_texture(hat_index)


func _set_hat_texture(index: int) -> void:
	var hat = hats_resource.hats[index] as HatItem
	hat_texture.texture = hat.texture
	hat_price_label.text = str(hat.price)
