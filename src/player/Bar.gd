extends Area2D

var polygon : Polygon2D
var bar_length : float
var stuck : Vector2
var hitpoint
var mouse_position : Vector2

func horizontal_size_polygon(poly):
	var low = 0
	var up = 0
	for point in poly.polygon:
		low = min(low, point.x)
		up = max(up, point.x)
	return abs(up - low)

func _ready():
	polygon = $Polygon2D
	bar_length = horizontal_size_polygon(polygon)
	stuck = Vector2.ZERO
	print("bar length : ", bar_length)
	polygon.color = Color.white
	hitpoint = $Hitpoint


func move_bar(dest_x):
	if stuck.x == 0 or position.x < dest_x:
		position.x = dest_x			
	elif stuck.y == 0 or position.x > dest_x:
		position.x = dest_x

func _on_Bar_area_entered(area):
	print("BAR: collided with: " + area.name)
	if area.name == "Ball":
		var bpos = area.global_position
		var barcenter = hitpoint.global_position
		var delta = (bpos - barcenter).x
		var fact = lerp(0.0, bar_length, delta / bar_length)
		area.bounce_vertical(fact)
		
	elif area.name == "LeftWall":
		stuck.x = 1
		stuck.y = 0
	elif area.name == "RightWall":
		stuck.y = 1

func _on_Bar_area_exited(area):
	stuck.x = 0
	stuck.y = 0
	
