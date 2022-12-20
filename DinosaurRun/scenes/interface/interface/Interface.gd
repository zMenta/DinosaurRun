extends Control

func update_coin(new_value: int) -> void:
	$CoinContainer.set_coin_value(new_value)

func update_score(new_value):
	$Label.text = str(new_value)
