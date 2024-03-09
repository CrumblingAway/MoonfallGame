class_name KeyHolder extends Node

signal num_of_keys_changed(new_num_of_keys: int)

var _num_of_keys : int = 0

func get_num_of_keys() -> int:
	return _num_of_keys

func increase_num_of_keys_by(key_increase: int) -> void:
	_num_of_keys += key_increase
	num_of_keys_changed.emit(_num_of_keys)

func decrease_num_of_keys_by(key_increase: int) -> void:
	_num_of_keys -= key_increase
	num_of_keys_changed.emit(_num_of_keys)
