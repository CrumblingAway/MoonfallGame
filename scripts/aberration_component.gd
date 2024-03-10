class_name AberrationComponent extends Node2D

const MAX_ABERRATION_LEVEL : int = 1

@export var _aberration_level : float = 0

func get_aberration_level() -> float:
	return _aberration_level

func increase_aberration_level_by(increase: float) -> void:
	_aberration_level = min(_aberration_level + increase, MAX_ABERRATION_LEVEL)

func decrease_aberration_level_by(decrease: float) -> void:
	_aberration_level = max(_aberration_level + decrease, 0.0)

func _on_key_holder_num_of_keys_changed(new_num_of_keys: float):
	_aberration_level = new_num_of_keys
