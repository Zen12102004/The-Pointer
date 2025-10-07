extends CharacterBody2D


var SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var UI = $"../../UI"
@onready var CDTimer = $SpeedCooldown
@onready var SpeedTimer = $SpeedTimer
var Cooldown = false
func _physics_process(delta):
	if(Input.is_action_just_pressed("Tab Key")):
		if(UI.visible == true):
			UI.visible = false
		else:
			UI.visible = true
	if(Input.is_action_just_pressed("ShiftKey")):
		if (Cooldown == false):
			CDTimer.start()
			Cooldown = true
			SPEED =400.0
			SpeedTimer.start()
	var direction = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up","ui_down")
	
	
	if direction && direction_y == 0:
		
		velocity.x = direction * SPEED
		if direction == 1:
			animated_sprite_2d.play("Right")
		else:
			animated_sprite_2d.play("Left")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction_y && direction == 0:
		
		velocity.y= direction_y * SPEED
		if direction_y == 1:
			animated_sprite_2d.play("down")
		else:
			animated_sprite_2d.play("default")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if direction != 0 && direction_y != 0 :
		# print(str(direction) + " , " + str(direction_y))
		velocity.x = direction * SPEED / pow(2,(0.5))
		velocity.y = direction_y*SPEED/pow(2,(0.5))
		if direction_y == 1 && direction == 1:
			animated_sprite_2d.play("Down_Right")
		elif direction_y == 1 && direction == -1:
			animated_sprite_2d.play("Down_Left")
		elif direction_y == -1 && direction == -1 :
			animated_sprite_2d.play("Up_Left")
		elif direction_y == -1 && direction == 1 :
			animated_sprite_2d.play("Up_Right")
	move_and_slide()

func _on_speed_cooldown_timeout():
	Cooldown = false

func _on_speed_timer_timeout():
	SPEED = 300
