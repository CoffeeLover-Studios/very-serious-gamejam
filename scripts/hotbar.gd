extends HBoxContainer

@onready var slots = get_children()

var current_index : int:
	set(value):
		current_index = value
		reset_focus()
		set_focus()

func _ready():
	current_index = 0
	scale.x = 0.8
	scale.y = 0.8
#turn off input
func reset_focus():
	for slot in slots:
		slot.set_process_input(false)

# highlight the slot + enable input
func set_focus():
	get_child(current_index).grab_focus()
	get_child(current_index).set_process_input(true)

#scroll through the slots
func _input(event):
	
	if event.is_action_pressed("scroll down"):
		scale.x = 0.8
		scale.y = 0.8
		if current_index == get_child_count() - 1:
			current_index = 0
		else:
			current_index += 1

	if event.is_action_pressed("scroll up"):
		scale.x = 0.8
		scale.y = 0.8
		if current_index == 0:
			current_index = get_child_count() - 1
		else:
			current_index -= 1

func add_item(stats):
	for slot in slots:
		if slot.stats == null:
			slot.stats = stats
			return
