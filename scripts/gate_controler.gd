class_name GateControler extends Node2D

@export var _gate : Gate

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func activate(num_of_keys: int) -> void:
	if num_of_keys >= _gate.get_num_of_keys_required():
		_gate.open()
	else:
		get_tree().root.get_node("Node2D/UILayer").display_label_at_position(
			global_position,
			str(num_of_keys) + " keys provided, " + str(_gate.get_num_of_keys_required()) + " required!",
			2.0
		)

func _on_area_2d_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is GateControlerReceiver:
			child.register_gate_controler(self)

func _on_area_2d_body_exited(body: Node2D) -> void:
	for child in body.get_children():
		if child is GateControlerReceiver:
			child.unregister_gate_controler(self)
