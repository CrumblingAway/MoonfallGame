class_name Player extends CharacterBody2D

@export var board_movement : BoardMovement

@export var _speed : float = 50.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
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
