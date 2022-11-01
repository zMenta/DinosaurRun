extends Node
class_name BaseState

enum State {
		Null,
		Walk,
		Fall,
		Jump,
		Dead,
	}

export (String) var animation_name

var player: Player

func enter() -> void:
	#player.animation.play(animation_name)
	pass

func exit() -> void:
	pass


func input(event: InputEvent) -> int:
	return State.Null

func process(delta: float) -> int:
	return State.Null

func physics_process(delta: float) -> int:
	return State.Null
