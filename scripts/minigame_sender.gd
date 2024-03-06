class_name MinigameSender extends Node2D

var _minigame : TreeMinigame

#################### Public methods. ####################

func start_minigame() -> void:
	for child in get_tree().root.get_children():
		if child is TreeMinigame:
			return
	
	if _minigame == null:	
		_minigame = preload("res://scenes/objects/tree_minigame.tscn").instantiate() as TreeMinigame
	
	var viewport_size : Rect2 = get_viewport_rect()
	var minigame_position = (viewport_size.position + viewport_size.end) / 2
	print(minigame_position)
	get_tree().root.add_child(_minigame)
	_minigame.position = minigame_position
	_minigame.end_minigame.connect(_end_minigame)

#################### Signal methods. ####################

func _on_area_2d_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is MinigameReceiver:
			child.register_minigame_sender(self)

func _on_area_2d_body_exited(body: Node2D) -> void:
	for child in body.get_children():
		if child is MinigameReceiver:
			child.unregister_minigame_sender(self)

func _end_minigame() -> void:
	_minigame.queue_free()
