tool
extends Area2D


export(bool) var fall_frozen = true setget set_fall_frozen
export(bool) var replace_at_start_position = false setget _replace_at_start_position

export(String) var label_text = "<>" setget set_label_text


var start_position : Vector2
var label : Label
var fall_speed : float = 0.9
var _default_fall_speed : float = fall_speed
var motion : Vector2 = Vector2.ZERO

func _ready():
	start_position = position
	label = $AnimatedLabel

func set_label_text(txt):
	label_text = txt
	label.text = label_text
	
func set_fall_frozen(state):
	fall_frozen = state
	if fall_frozen:
		fall_speed = 0.0
	else:
		fall_speed = _default_fall_speed

func _replace_at_start_position(state):
	replace_at_start_position = state
	if replace_at_start_position:
		position = start_position
		replace_at_start_position = false


func _physics_process(delta):
	if !fall_frozen:
		motion.y = fall_speed
		global_position += motion
		motion = Vector2.ZERO
		
