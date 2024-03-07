class_name Gate extends Node2D

@export var _num_of_keys_required : int = 3
@export var _is_player_gate : bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func open() -> void:
	pass

func get_num_of_keys_required() -> int:
	return _num_of_keys_required
