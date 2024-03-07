class_name GateControlerReceiver extends Node2D

var _gate_controlers : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func has_registered_gate_controler() -> bool:
	return _gate_controlers.size() > 0

func activate(num_of_keys: int) -> void:
	var closest_gate_controler : GateControler = null
	for gate_controler in _gate_controlers:
		if closest_gate_controler == null:
			closest_gate_controler = gate_controler
			continue
		
		if global_position.distance_to(gate_controler.global_position) <\
		   global_position.distance_to(closest_gate_controler.global_position):
			closest_gate_controler = gate_controler
	
	if closest_gate_controler != null:
		closest_gate_controler.activate(num_of_keys)

func register_gate_controler(gate_controler: GateControler) -> void:
	_gate_controlers[gate_controler] = null

func unregister_gate_controler(gate_controler: GateControler) -> void:
	_gate_controlers.erase(gate_controler)
