class_name BoardMovement extends Node

@export var _board : Board

#################### Public mehods. ####################

func move(
	body_to_move: CharacterBody2D,
	velocity: Vector2
) -> void:
	body_to_move.velocity = velocity
	body_to_move.move_and_slide()
