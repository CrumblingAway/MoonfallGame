class_name SpeedBuff extends Node

var _speed_buff_increase : float = 20.0

func _on_area_2d_body_entered(body: Node2D):
	if body is Player:
		body.increase_speed(_speed_buff_increase)
		queue_free()
