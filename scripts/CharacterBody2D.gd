extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 70.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	#Horizontal movement
	var direction_x = Input.get_axis("left","right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#Vertical movement
	var direction_y = Input.get_axis("up","down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if direction_x < 0:
		animated_sprite_2d.play("Walk_Horizontal")
		animated_sprite_2d.flip_h = false
	elif direction_x > 0:
		animated_sprite_2d.play("Walk_Horizontal")
		animated_sprite_2d.flip_h = true
	elif direction_y < 0:
		animated_sprite_2d.play("Walk_Up")
	elif direction_y > 0:
		animated_sprite_2d.play("Walk_Down")
	else:
		animated_sprite_2d.play("Idle")

	move_and_slide()
