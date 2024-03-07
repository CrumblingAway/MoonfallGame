class_name MinigameSender extends Node2D

var _minigame : TreeMinigame
var _key_holder : KeyHolder

#################### Public methods. ####################

func start_minigame(key_holder: KeyHolder) -> void:
	for child in get_tree().root.get_children():
		if child is TreeMinigame:
			return
	
	if _minigame == null:	
		_minigame = preload("res://scenes/objects/tree_minigame.tscn").instantiate() as TreeMinigame
	
	var minigame_position = get_viewport().get_camera_2d().global_position
	get_tree().root.add_child(_minigame)
	_minigame.global_position = minigame_position
	_minigame.end_minigame.connect(_end_minigame)
	_key_holder = key_holder

#################### Signal methods. ####################

func _on_area_2d_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is MinigameReceiver:
			child.register_minigame_sender(self)

func _on_area_2d_body_exited(body: Node2D) -> void:
	for child in body.get_children():
		if child is MinigameReceiver:
			child.unregister_minigame_sender(self)

func _end_minigame(num_of_keys_acquired: int) -> void:
	_minigame.queue_free()
	_key_holder.increase_num_of_keys_by(num_of_keys_acquired)
	print(_key_holder.get_num_of_keys())
