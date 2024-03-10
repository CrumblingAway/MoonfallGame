class_name UILayer extends Node

@onready var _num_of_keys_label : Label = $Label
@export var _player : Player

func _ready() -> void:
	_num_of_keys_label.text = str(_player.key_holder.get_num_of_keys())

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("display_menu"):
		_player.freeze()
		_display_menu()

func _on_key_holder_num_of_keys_changed(new_num_of_keys: int) -> void:
	_num_of_keys_label.text = str(new_num_of_keys)

func _on_win_area_body_entered(body: Node2D) -> void:
	if body is Player:
		_attach_win_label()

func _attach_win_label() -> void:
	var win_label : Label = Label.new()
	win_label.text = "You've won!"
	add_child(win_label)
	win_label.position = get_viewport().get_visible_rect().size / 2 - win_label.size / 2

func _quit_game() -> void:
	get_tree().quit()

func _display_menu() -> void:
	var _resume_button : Button = Button.new()
	_resume_button.text = "Resume"
	_resume_button.pressed.connect(_resume)
	_resume_button.position = get_viewport().get_visible_rect().size / 2 - Vector2(0, 20)
	add_child(_resume_button)
	
	var _quit_button : Button = Button.new()
	_quit_button.text = "Quit"
	_quit_button.pressed.connect(_quit_game)
	_quit_button.position = get_viewport().get_visible_rect().size / 2 + Vector2(0, 20)
	add_child(_quit_button)

func _resume() -> void:
	for child in get_children():
		if child is Button:
			remove_child(child)
	_player.unfreeze()
