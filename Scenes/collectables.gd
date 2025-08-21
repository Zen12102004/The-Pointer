extends Area2D

@onready var game_manager = $"../../System"

# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	if(body.name == "Player"):
		game_manager.add_points()
		queue_free()

