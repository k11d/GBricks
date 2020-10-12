extends Sprite
class_name Sprite2

var _offset setget _set_offset, _get_offset
export(NodePath) var target_node = null

func remote_offset():
	if target_node:
		target_node.local

func _set_offset(value: Vector2):
	offset = value
	print("new offset: ", offset)

func _get_offset():
	return offset

