extends Area2D
class_name Ball, "res://assets/ball.png"

var speed := Vector2(100, 750)
var motion := Vector2.ZERO
var _colliding := Vector2.ZERO # x=horizontal, y=vertical, 1=Colliding, 0=Not colliding
var _default_color : Color
var _colliders : Array


func _physics_process(delta):
	if _colliding.x:
		bounce_horizontal()
		_colliding.x = 0
	if _colliding.y:
		bounce_vertical()
		_colliding.y = 0
	motion += speed * delta
	global_position += motion
	motion = Vector2.ZERO


func bounce_horizontal(y_off=0.0):
	speed.x = -speed.x
	speed.y += y_off * 2
	$AnimationPlayer.play("BounceLR")
	

func bounce_vertical(x_off=0.0):
	speed.y = -speed.y			
	speed.x += x_off * 2
	$AnimationPlayer.play("BounceTB")


func _on_Ball_area_entered(area):
	match area.get_parent().name:
		var apname:
			match apname:
				"Bricks":
					hit_brick(area)
				"Room":
					hit_wall(area)
				"Balls":
					hit_ball(area)

func _on_Ball_area_exited(area):
	match area.get_parent().name:
		var apname:
			match apname:
				"Bricks":
					pass
				"Room":
					pass


func hit_brick(brick : Brick):
	brick.decrement_hitpoints()
	bounce_vertical()

func hit_wall(wall : Wall):
	wall.flash()
	if wall.name.begins_with("Top") or wall.name.begins_with("Bottom"):
		bounce_vertical()
	elif wall.name.begins_with("Left") or wall.name.begins_with("Right"):
		bounce_horizontal()
	
func hit_ball(ball : Ball):
	print("Collided with another ball: ", ball.name)
