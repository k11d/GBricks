tool
extends Label

var label_frozen = true setget set_label_frozen
var animation_player : AnimationPlayer

func set_label_frozen(state):
	label_frozen = state
	if label_frozen:
		animation_player.stop(false)
	else:
		animation_player.play("Idle")

func set_label_text(txt):
	if txt:
		text = txt
	else:
		text = "<>"
