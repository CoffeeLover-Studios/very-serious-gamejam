extends Control

@onready var timer = $Timer
@onready var timer_bar = $CanvasLayer/Panel/ProgressBar
@onready var text = $CanvasLayer/Panel/text

var timer_display = 600.00
var minutes = floor(timer_display/60)
var seconds = fmod(timer_display,60)

#displaying minutes and seconds text + update timer
func _on_timer_timeout():
	timer_display -= 1
	minutes = floor(timer_display/60)
	seconds = fmod(timer_display,60)
	text.text = "Time Remaining:"+str(int(minutes)).pad_zeros(2)+":"+str(int(seconds)).pad_zeros(2)
	timer_bar.value = timer_display
func _ready():
	text.text = "Time Remaining:"+str(int(minutes)).pad_zeros(2)+":"+str(int(seconds)).pad_zeros(2)
	minutes = floor(timer_display/60)
	seconds = fmod(timer_display,60)
	timer_bar.value = timer_display

