class_name TreeMinigame extends Node

signal end_minigame

@export var _camera : Camera2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		emit_signal("end_minigame")
