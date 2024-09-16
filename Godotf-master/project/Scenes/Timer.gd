extends Label
@onready var timer = $"../../Timer"
var total_timer = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	total_timer += timer.wait_time
	var minutes = int(total_timer/60.0)
	var seconds = int(total_timer - minutes * 60)
	var miliseconds = round((total_timer - minutes * 60 - seconds)* 100)
	self.text = str(minutes) +":"+ str(seconds) +":"+ str(miliseconds)
