class_name DialogSender extends Node2D

@export var _dialog_text : String = "Default dialog text."

#################### Public methods. ####################

func get_dialog_text() -> String:
	return _dialog_text + " (" + $"..".name + ")"

#################### Signal methods. ####################

func _on_area_2d_body_entered(body: Node2D):
	for child in body.get_children():
		if child is DialogReceiver:
			child.register_dialog_sender(self)

func _on_area_2d_body_exited(body: Node2D):
	for child in body.get_children():
		if child is DialogReceiver:
			child.unregister_dialog_sender(self)
