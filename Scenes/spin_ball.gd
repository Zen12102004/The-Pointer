extends CharacterBody2D
@onready var target = $"../Player"

var SPEED = 300.0

func _physics_process(delta):
	var direction = (target.position-position).normalized()
	velocity = direction*SPEED
	look_at(target.position)
	move_and_slide()
	for i in range(get_slide_collision_count()):
			var collision = get_slide_collision(i)
			if collision.get_collider().name == "Player":
				System.dec_points()
				queue_free()
				break   
	
func _on_timer_timeout():
	queue_free()
