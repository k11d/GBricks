extends Node2D
class_name Room, "res://assets/walls_v.png"


func toggle_top():
	$TopWall.visible = !$TopWall.visible

func toggle_bottom():
	$BottomWall.visible = !$BottomWall.visible

func toggle_left():
	$LeftWall.visible = !$LeftWall.visible

func toggle_right():
	$RightWall.visible = !$RightWall.visible
