class_name MinigameReceiver extends Node2D

var _minigame_senders_to_distance : Dictionary

#################### Public methods. ####################

func register_minigame_sender(minigame_sender: MinigameSender) -> void:
	_minigame_senders_to_distance[minigame_sender] = null

func unregister_minigame_sender(minigame_sender: MinigameSender) -> void:
	_minigame_senders_to_distance.erase(minigame_sender)

func has_registered_minigame() -> bool:
	return _minigame_senders_to_distance.size() > 0

func start_minigame() -> void:
	var closest_minigame_sender : MinigameSender = null
	for minigame_sender in _minigame_senders_to_distance:
		if closest_minigame_sender == null:
			closest_minigame_sender = minigame_sender
			continue
		
		if global_position.distance_to(minigame_sender.global_position) <\
		   global_position.distance_to(closest_minigame_sender.global_position):
			closest_minigame_sender = minigame_sender
	
	if closest_minigame_sender != null:
		closest_minigame_sender.start_minigame()
