extends Button

@onready var player = get_tree().current_scene.find_child("player")

@export var stats: Item = null:
	set(value):
		stats = value
		
		if value != null:
			icon = value.icon
		else:
			icon = null

