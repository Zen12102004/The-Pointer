extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var UI = $"../../UI"

func _physics_process(delta):
	if(Input.is_action_just_pressed("Tab Key")):
		if(UI.visible == true):
			UI.visible = false
		else:
			UI.visible = true
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction == 1:
			animated_sprite_2d.animation = "Right"
		else:
			animated_sprite_2d.animation = "Left"
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction_y = Input.get_axis("ui_up","ui_down")
	if direction_y:
		velocity.y= direction_y * SPEED
		if direction_y == 1:
			animated_sprite_2d.animation = "down"
		else:
			animated_sprite_2d.animation = "default"
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
