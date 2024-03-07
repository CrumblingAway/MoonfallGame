class_name MinigameReceiver extends Node2D

var _minigame_senders_to_distance : Dictionary
var _current_minigame_sender : MinigameSender

#################### Public methods. ####################

func register_minigame_sender(minigame_sender: MinigameSender) -> void:
	_minigame_senders_to_distance[minigame_sender] = null

func unregister_minigame_sender(minigame_sender: MinigameSender) -> void:
	_minigame_senders_to_distance.erase(minigame_sender)

func has_registered_minigame() -> bool:
	return _minigame_senders_to_distance.size() > 0

func start_minigame(key_holder: KeyHolder) -> void:
	_current_minigame_sender = null
	for minigame_sender in _minigame_senders_to_distance:
		if _current_minigame_sender == null:
			_current_minigame_sender = minigame_sender
			continue
		
		if global_position.distance_to(minigame_sender.global_position) <\
		   global_position.distance_to(_current_minigame_sender.global_position):
			_current_minigame_sender = minigame_sender
	
	if _current_minigame_sender != null:
		_current_minigame_sender.start_minigame(key_holder)

func is_minigame_running() -> bool:
	for child in get_tree().root.get_children():
		if child is TreeMinigame:
			return true
	return false
