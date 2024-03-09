class_name GateControler extends Node2D

@export var _gate : Gate

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func activate(key_holder: KeyHolder) -> void:
	if key_holder.get_num_of_keys() >= _gate.get_num_of_keys_required():
		_gate.open()
		key_holder.decrease_num_of_keys_by(_gate.get_num_of_keys_required())
	else:
		var _message_label : SelfDestructingLabel = SelfDestructingLabel.new()
		_message_label.set_text(str(key_holder.get_num_of_keys()) + " keys provided, " + str(_gate.get_num_of_keys_required()) + " required!")
		_message_label.set_timer(2.0)
		add_child(_message_label)

func _on_area_2d_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is GateControlerReceiver:
			child.register_gate_controler(self)

func _on_area_2d_body_exited(body: Node2D) -> void:
	for child in body.get_children():
		if child is GateControlerReceiver:
			child.unregister_gate_controler(self)
