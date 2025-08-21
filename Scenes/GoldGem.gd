extends Area2D



func _on_body_entered(body):
	if(body.name == "Player"):
		System.aoc -= 1
		System.healing(3)
		System.add_points(10)
		queue_free()
