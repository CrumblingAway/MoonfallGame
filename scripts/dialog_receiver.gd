class_name DialogReceiver extends Node2D

var _dialog_senders_to_distance : Dictionary

#################### Node methods. ####################

func _ready():
	pass

#################### Public methods. ####################

func register_dialog_sender(dialog_sender: DialogSender) -> void:
	_dialog_senders_to_distance[dialog_sender] = null

func unregister_dialog_sender(dialog_sender: DialogSender) -> void:
	_dialog_senders_to_distance.erase(dialog_sender)

func has_registered_dialog() -> bool:
	return _dialog_senders_to_distance.size() > 0

func print_dialog_text() -> void:
	var closest_dialog_sender : DialogSender = null
	for dialog_sender in _dialog_senders_to_distance:
		if closest_dialog_sender == null:
			closest_dialog_sender = dialog_sender
			continue
		
		if global_position.distance_to(dialog_sender.global_position) <\
		   global_position.distance_to(closest_dialog_sender.global_position):
			closest_dialog_sender = dialog_sender
	
	if closest_dialog_sender != null:
		print(closest_dialog_sender.get_dialog_text())
