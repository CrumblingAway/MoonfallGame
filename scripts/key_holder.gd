class_name KeyHolder extends Node

var _num_of_keys : int = 0

func get_num_of_keys() -> int:
	return _num_of_keys

func increase_num_of_keys_by(key_increase: int) -> void:
	_num_of_keys += key_increase

func decrease_num_of_keys_by(key_increase: int) -> void:
	_num_of_keys -= key_increase
