class_name AberrationComponent extends Node2D

const MAX_ABERRATION_LEVEL : int = 4

@export var _aberration_level : int = 0

func get_aberration_level() -> int:
	return _aberration_level

func increase_aberration_level_by(increase: int) -> void:
	_aberration_level += increase

func decrease_aberration_level_by(decrease: int) -> void:
	_aberration_level -= decrease
