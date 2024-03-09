class_name TreeMinigame extends Node2D

signal end_minigame

@export var _player_bar : CharacterBody2D
@export var _target_bar : Area2D

var _score : int = 0
var _are_targets_overlapping : bool

@export var _player_speed : float = 40.0
var _aberration_level : float = 0

var _directions = [
	Vector2i(0, 1),
	Vector2i(1, 0),
	Vector2i(0, -1),
	Vector2i(-1, 0)
]
var _direction_timer : float = 0.0
var _current_direction_index = 0

func _ready() -> void:
	_player_bar.velocity = Vector2(0.0, _player_speed) * (_aberration_level + 1)
	_direction_timer = AberrationComponent.MAX_ABERRATION_LEVEL - _aberration_level

func _process(delta: float) -> void:
	_direction_timer -= delta
	if _direction_timer <= 0:
		_direction_timer = AberrationComponent.MAX_ABERRATION_LEVEL - _aberration_level
		_current_direction_index = (_current_direction_index + 1) % 4
	
	$ColorRect.material.set_shader_parameter("direction", _directions[_current_direction_index])
	
	_player_bar.move_and_slide()
	if Input.is_action_just_pressed("action"):
		_player_bar.velocity = Vector2.ZERO
		if _are_targets_overlapping:
			_score += 1
			_player_bar.get_node("AnimatedSprite2D").play("success")
		else:
			_player_bar.get_node("AnimatedSprite2D").play("failure")
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	_are_targets_overlapping = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	_are_targets_overlapping = false

func _on_key_despawn_area_body_entered(body: Node2D) -> void:
	_player_bar.velocity = Vector2.ZERO
	
	_player_bar.get_node("AnimatedSprite2D").play("failure")

func set_aberration_level(aberration_level: float) -> void:
	_aberration_level = aberration_level

func _on_animated_sprite_2d_animation_finished():
	_player_bar.queue_free()
	end_minigame.emit(_score)
