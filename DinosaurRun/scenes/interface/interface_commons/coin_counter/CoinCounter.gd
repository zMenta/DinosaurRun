extends HBoxContainer


func set_coin_value(coin_amount: int) -> void:
	$Label.text = "x " + str(coin_amount)
