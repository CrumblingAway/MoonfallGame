class_name TreeMinigame extends Node

signal end_minigame

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		emit_signal("end_minigame")
