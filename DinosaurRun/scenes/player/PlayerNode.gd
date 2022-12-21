extends Node2D

signal player_died

onready var sprite_hat := $Player/Sprite/SpriteHat

export(Resource) var hats_resource
var current_hat_index := 0 setget set_hat


func set_hat(hat_index: int) -> void:
	current_hat_index = hat_index
	sprite_hat.texture = hats_resource.hats_textures[hat_index]


func _on_Player_died():
	emit_signal("player_died")


func revive_player() -> void:
	$Player.revive()
