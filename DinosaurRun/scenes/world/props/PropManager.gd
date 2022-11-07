extends Node2D

signal cloud_spawned(cloud)

export(PackedScene) var Plant
export(PackedScene) var Cloud

onready var cloud_path_follow := $CloudPath/PathFollow2D

var cloud_timer : Timer
var plant_timer : Timer


func _on_CloudTimer_timeout() -> void:
	randomize()

	cloud_path_follow.offset += randi()

	var cloud = Cloud.instance()
	cloud.global_position = cloud_path_follow.global_position
	emit_signal("cloud_spawned", cloud)
