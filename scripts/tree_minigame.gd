class_name TreeMinigame extends Node2D

signal end_minigame

@export var _player_bar : CharacterBody2D
@export var _target_bar : Area2D

var _score : int = 0
var _are_targets_overlapping : bool

@export var _player_speed : float = 40.0

func _ready() -> void:
	_player_bar.velocity = Vector2(0.0, _player_speed)

func _process(delta: float) -> void:
	_player_bar.move_and_slide()
	if Input.is_action_just_pressed("action"):
		# Flash target bar.
		
		# Check _are_targets_overlapping.
		if _are_targets_overlapping:
			_score += 1
			print("One key gained")

func _on_area_2d_body_entered(body: Node2D) -> void:
	_are_targets_overlapping = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	_are_targets_overlapping = false

func _on_key_despawn_area_body_entered(body: Node2D) -> void:
	_player_bar.velocity = Vector2.ZERO
	
	if _score > 0:
		pass
	
	end_minigame.emit(_score)
