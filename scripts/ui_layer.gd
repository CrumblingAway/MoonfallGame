class_name UILayer extends Node

@onready var _num_of_keys_label : Label = $Label
@export var _player : Player

func _ready() -> void:
	_num_of_keys_label.text = str(_player.key_holder.get_num_of_keys())

func _process(delta: float) -> void:
	pass

func _on_key_holder_num_of_keys_changed(new_num_of_keys: int) -> void:
	_num_of_keys_label.text = str(new_num_of_keys)

func _on_win_area_body_entered(body: Node2D) -> void:
	if body is Player:
		_attach_win_label()

func _attach_win_label() -> void:
	var win_label : Label = Label.new()
	win_label.text = "You've won!"
	add_child(win_label)
	win_label.position = get_viewport().get_camera_2d().global_position - win_label.size / 2

func display_label_at_position(
	label_position: Vector2,
	label_text: String,
	duration: float = 1.0
) -> void:
	var new_label : SelfDestructingLabel = SelfDestructingLabel.new()
	new_label.set_text(label_text)
	new_label.set_timer(duration)
	add_child(new_label)
	new_label.position = label_position - new_label.size() / 2