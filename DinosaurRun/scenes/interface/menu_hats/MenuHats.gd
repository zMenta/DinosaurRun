extends Control

signal buyButton_pressed
signal mainMenuButton_pressed


func _on_ButtonGoBack_pressed():
	emit_signal("mainMenuButton_pressed")


func _on_ButtonBuy_pressed():
	pass
	# emit_signal("buyButton_pressed")
