extends Area2D


func _on_body_entered(body):
	if(body.name == "Player"):
		System.aoc -= 1
		System.add_points(1)
		queue_free()
		
