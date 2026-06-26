extends Sprite2D

@onready var collision = $Area2D/CollisionShape2D
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer


@export var stats: Item

#assign texture if stats has item
func _ready():
	if stats != null:
		texture = stats.icon

#player collision
func _on_area_2d_body_entered(body):
	#reparent to player's "Weapons" node
	call_deferred("reparent",body.find_child("Weapons"))
	#delete item
	animation_player.play("pickup")
	timer.start()
	body.add_item(stats)
	#disable collision
	collision.call_deferred("set_disabled",true)


func _on_timer_timeout():
	queue_free()
