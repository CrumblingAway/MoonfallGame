class_name Player extends CharacterBody2D

@onready var board_movement : BoardMovement = $BoardMovement
@onready var dialog_receiver : DialogReceiver = $DialogReceiver
@onready var minigame_receiver : MinigameReceiver = $MinigameReceiver
@onready var gate_controler_receiver : GateControlerReceiver = $GateControlerReceiver
@onready var key_holder : KeyHolder = $KeyHolder

@export var _speed : float = 50.0

@export var _can_move : bool

func _ready() -> void:
	_can_move = true

func _process(delta: float) -> void:
	_process_input(delta)

#################### Public methods. ####################

func increase_speed(increase_delta: float) -> void:
	_speed += increase_delta

#################### Private methods. ####################

func _process_input(delta: float) -> void:
	_can_move = not minigame_receiver.is_minigame_running()
	
	if Input.is_action_just_pressed("action"):
		if dialog_receiver.has_registered_dialog():
			dialog_receiver.print_dialog_text()
		elif minigame_receiver.has_registered_minigame():
			minigame_receiver.start_minigame(key_holder)
		elif gate_controler_receiver.has_registered_gate_controler():
			gate_controler_receiver.activate(key_holder.get_num_of_keys())
	
	if _can_move:
		var current_velocity : Vector2 = Vector2.ZERO
		if Input.is_action_pressed("move_up"):
			current_velocity += Vector2.UP
		if Input.is_action_pressed("move_down"):
			current_velocity += Vector2.DOWN
		if Input.is_action_pressed("move_left"):
			current_velocity += Vector2.LEFT
		if Input.is_action_pressed("move_right"):
			current_velocity += Vector2.RIGHT
		board_movement.move(self, current_velocity * _speed)
