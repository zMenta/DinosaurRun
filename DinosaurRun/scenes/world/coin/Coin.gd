extends Area2D
class_name Coin

export(float) var speed : float = 120
export(bool) var is_moving : bool = true

func _ready():
	randomize()
	if randi() % 2 == 1:
		$AnimationPlayer.play("idle")
	else:
		$AnimationPlayer.play("idle2")



func _physics_process(delta: float) -> void:
	if not is_moving:
		return
		
	position.x -= speed * delta


func _on_Coin_body_entered(body: Node) -> void:
	if body is Player:
		GlobalSignals.emit_signal("coin_obtained")
		$AnimationPlayer.play("pickup")


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
