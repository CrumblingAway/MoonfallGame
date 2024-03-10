class_name UILayer extends Node

@onready var _num_of_keys_label : Label = $Label
@export var _player : Player

var _instructions_text : String =\
	"You're trapped on a moon and your only escape is through your gate.\n" +\
	"You open the gate using keys you collect from the trees.\n" +\
	"You will find, however, that collecting keys becomes progressively \"problematic\".\n" +\
	"At your discretion you may help other trapped denizens escape."

func _ready() -> void:
	_num_of_keys_label.text = str(_player.key_holder.get_num_of_keys())
	
	var _instructions_label : Label = Label.new()
	_instructions_label.label_settings = LabelSettings.new()
	_instructions_label.label_settings.font_size = 6
	_instructions_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_instructions_label.text = _instructions_text
	_instructions_label.name = "InstructionsLabel"
	add_child(_instructions_label)
	_instructions_label.position = get_viewport().get_visible_rect().size / 2 - _instructions_label.size / 2
	
	var _start_button : Button = Button.new()
	_start_button.text = "Start"
	_start_button.pressed.connect(_start_game)
	_start_button.name = "StartButton"
	add_child(_start_button)
	_start_button.position = get_viewport().get_visible_rect().size / 2 - _start_button.get_rect().size / 2 + Vector2(0, _instructions_label.size.y + _start_button.get_rect().size.y)
	
	_player.freeze()

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

func _start_game() -> void:
	remove_child(get_node("InstructionsLabel"))
	remove_child(get_node("StartButton"))
	_player.unfreeze()

func _quit_game() -> void:
	get_tree().quit()

func _display_menu() -> void:
	var _resume_button : Button = Button.new()
	_resume_button.text = "Resume"
	_resume_button.pressed.connect(_resume)
	add_child(_resume_button)
	_resume_button.position = get_viewport().get_visible_rect().size / 2 - _resume_button.get_rect().size / 2 - Vector2(0, 20)
	
	var _quit_button : Button = Button.new()
	_quit_button.text = "Quit"
	_quit_button.pressed.connect(_quit_game)
	add_child(_quit_button)
	_quit_button.position = get_viewport().get_visible_rect().size / 2 - _quit_button.get_rect().size / 2 + Vector2(0, 20)

func _resume() -> void:
	for child in get_children():
		if child is Button:
			remove_child(child)
	_player.unfreeze()
