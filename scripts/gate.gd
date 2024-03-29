class_name Gate extends Node2D

@export var _num_of_keys_required : int = 3
@export var _is_player_gate : bool = false

@onready var _win_area : Area2D = $WinArea

func _ready() -> void:
	remove_child(_win_area)

func _process(delta: float) -> void:
	pass

func open() -> void:
	$AnimatedSprite2D.play()
	add_child(_win_area)

func get_num_of_keys_required() -> int:
	return _num_of_keys_required
