extends Node2D

onready var _BallScene := preload("res://src/entities/balls/Ball.tscn")
onready var _BrickScene := preload("res://src/bricks/Brick.tscn")



enum MouseMode { BALL, BLOCK }
var mouse_mode : int = MouseMode.BLOCK setget _set_mouse_mode
var bar : Area2D
var balls : Node2D
var bricks : Node2D


func _ready():
	bar = $Bar
	balls = $Balls
	bricks = $Bricks
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	

func _set_mouse_mode(mode):
	mouse_mode = mode
	match mouse_mode:
		MouseMode.BALL:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		MouseMode.BLOCK:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func toggle_mouse_mode():
	if mouse_mode == MouseMode.BALL:
		_set_mouse_mode(MouseMode.BLOCK)
	else:
		_set_mouse_mode(MouseMode.BALL)		


func _physics_process(delta):
	bar.move_bar(get_global_mouse_position().x)


func _unhandled_input(event):
	if event.is_action_pressed("Add Object"):
		if mouse_mode == MouseMode.BLOCK:
			spawn_new_brick(get_global_mouse_position())
	elif event.is_action_pressed("Cursor Mode"):
		toggle_mouse_mode()
	elif event.is_action_pressed("New Ball"):
		spawn_new_ball(
				Vector2(get_global_mouse_position().x, 
				OS.get_window_size().y - 100))

func spawn_new_ball(pos):
	
	var ball = _BallScene.instance()
	add_child(ball)
	ball.set_owner(self)
	ball.global_position = pos

func spawn_new_brick(pos):
	var b = _BrickScene.instance()
	bricks.add_child(b)
	b.set_owner(bricks)
	b.position = pos
