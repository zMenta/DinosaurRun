extends Node2D

var coins : Array
var speed : float = 0.0 setget set_coins_speed
var is_moving : bool = true setget set_is_moving


func _ready():
	coins = get_coins()

func get_coins() -> Array:
	return $CoinsGroup.get_children()

func set_coins_speed(new_speed: float) -> void:
	speed = new_speed
	coins = get_coins()
	for coin in coins:
		coin.speed = new_speed

func set_is_moving(new_value: bool) -> void:
	is_moving = new_value
	coins = get_coins()
	for coin in coins:
		coin.is_moving = new_value


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
