extends Node

@onready var _num_of_keys_label : Label = $Label
@export var _player : Player

func _ready() -> void:
	_num_of_keys_label.text = str(_player.key_holder.get_num_of_keys())

func _process(delta: float) -> void:
	pass

func _on_key_holder_num_of_keys_changed(new_num_of_keys: int) -> void:
	_num_of_keys_label.text = str(new_num_of_keys)
