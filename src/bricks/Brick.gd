extends Area2D
class_name Brick

var polygon : Polygon2D
var hp_label : Label
var animation_player : AnimationPlayer

export(Color) var color setget set_color
export(int) var hitpoints = -1 setget set_hitpoints


func _ready():
	polygon = $Polygon2D
	hp_label = $Label
	hp_label.text = str(hitpoints)
	animation_player = $AnimationPlayer

func polygon_points():
	if polygon:
		return polygon.polygon

func set_color(col):
	color = col
	if color and polygon:
		polygon.color = color


func set_hitpoints(hp):
	hitpoints = hp
	if hp_label:
		hp_label.text = str(hitpoints)
	if hitpoints == 0:
		if animation_player:
			animation_player.play("Fade Out")

func decrement_hitpoints():
	if hitpoints >= 0:
		set_hitpoints(hitpoints - 1)

func increment_hitpoints():
	set_hitpoints(hitpoints + 1)
	
func destroy():
	queue_free()
#	visible = false
