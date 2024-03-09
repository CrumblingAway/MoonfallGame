class_name SelfDestructingLabel extends Node2D

@export var _label : Label
@export var _timer : float

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	_timer -= delta
	if _timer <= 0.0:
		queue_free()

func set_text(text: String) -> void:
	if _label == null:
		_label = Label.new()
		_label.label_settings = LabelSettings.new()
		_label.label_settings.font_size = 6
		add_child(_label)
	_label.text = text

func set_timer(timer: float) -> void:
	_timer = timer

func size() -> Vector2i:
	return _label.size
