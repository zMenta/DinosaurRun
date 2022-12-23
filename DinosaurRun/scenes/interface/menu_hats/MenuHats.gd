extends Control

signal buyButton_pressed(save)
signal mainMenuButton_pressed

onready var hat_texture := $ColorRect/VBoxContainer/HBoxContainer/HatTextureRect
onready var hat_price_label := $ColorRect/VBoxContainer/HBoxContainer2/PriceValue
onready var buy_button := $ColorRect/VBoxContainer/ButtonBuy
onready var coin_container := $CoinContainer

var hats_resource
var save: SaveData setget set_save_data
var hat_index: int = 0
var total_coins := 0


func set_save_data(new_save: SaveData) -> void:
	save = new_save
	hat_index = save.hats.current_hat_index
	hats_resource = save.hats
	_set_hat_texture(hat_index)
	_set_coins(save.player_stats.total_coins)


func _on_ButtonGoBack_pressed():
	emit_signal("mainMenuButton_pressed")


func _on_ButtonBuy_pressed():
	if not hat_index in hats_resource.hats_index_owned:
		hats_resource.hats_index_owned.append(hat_index)

	hats_resource.current_hat_index = hat_index
	_set_hat_texture(hat_index)
	save.hats = hats_resource
	emit_signal("buyButton_pressed", save)


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

	if index in hats_resource.hats_index_owned:
		buy_button.text = "Wear"
		hat_price_label.text = "Owned"

	else:
		buy_button.text = "Buy"
		hat_price_label.text = str(hat.price)


func _set_coins(new_value) -> void:
	total_coins = new_value
	coin_container.set_coin_value(save.player_stats.total_coins)
