class_name MinigameSender extends Node2D

#################### Public methods. ####################

func start_minigame() -> void:
	print("Minigame started." + "(" + $"..".name + ")")

#################### Signal methods. ####################

func _on_area_2d_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is MinigameReceiver:
			child.register_minigame_sender(self)

func _on_area_2d_body_exited(body: Node2D) -> void:
	for child in body.get_children():
		if child is MinigameReceiver:
			child.unregister_minigame_sender(self)
