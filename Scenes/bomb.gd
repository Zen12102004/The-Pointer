extends Area2D

var Player_entered = false

func _on_body_entered(body):
	if(body.name == "Player"):
		Player_entered = true

func _on_body_exited(body):
	if(body.name == "Player"):
		Player_entered = false

func _on_timer_timeout():
	if Player_entered == true:
		System.dec_points()
	queue_free()
	
