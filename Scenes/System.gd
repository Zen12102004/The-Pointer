extends Node
signal point_changed(new_value: int)
signal health_changed(new_value:int)

var LimitSpawn = 9


var _point: int = 0:
	set(value):
		_point = value
		emit_signal("point_changed", _point)
var health: int = 100:
	set(value):
		health = value
		emit_signal("health_changed", health)
var aoc = 0
func add_points(i):
	_point += i;
	if _point >= 10:
		LimitSpawn = 13
	if _point >= 20:
		LimitSpawn = 20

func healing(i):
	health = health + i
	if health > 100:
		health = 100

func dec_points():
	_point -= 1
	health -= 10
	if(health <= 0):	
		get_tree().change_scene_to_file("res://Scenes/Game Over.tscn")
	
	
