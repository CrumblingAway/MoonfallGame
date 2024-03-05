class_name Player extends CharacterBody2D

@export var board_movement : BoardMovement
@export var dialog_receiver : DialogReceiver
@export var minigame_receiver : MinigameReceiver

@export var _speed : float = 50.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		if dialog_receiver.has_registered_dialog():
			dialog_receiver.print_dialog_text()
		elif minigame_receiver.has_registered_minigame():
			minigame_receiver.start_minigame()
	
	var velocity : Vector2 = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity += Vector2.UP
	if Input.is_action_pressed("move_down"):
		velocity += Vector2.DOWN
	if Input.is_action_pressed("move_left"):
		velocity += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		velocity += Vector2.RIGHT
	
	board_movement.move(self, velocity * _speed)

#################### Public mehods. ####################

func increase_speed(increase_delta: float) -> void:
	_speed += increase_delta
