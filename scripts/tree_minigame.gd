class_name TreeMinigame extends Node2D

signal end_minigame

@export var _player_bar : RigidBody2D
@export var _target_bar : Area2D

var _score : int = 0
var _are_targets_overlapping : bool

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		if _are_targets_overlapping:
			_score += 1
			print("Score: " + str(_score))
	
	if _player_bar.position.y > 300.0:
		print("Score: " + str(_score))
		end_minigame.emit()

func _on_area_2d_body_entered(body: Node2D) -> void:
	_are_targets_overlapping = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	_are_targets_overlapping = false
