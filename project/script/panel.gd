extends Node2D
@onready var Score = $CanvasLayer/Score
@onready var timer = $Timer
var open = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		if open == false:
			timer.stop()
			Score.visible = true
			open = true
			Engine.time_scale = 0
		else:
			Score.visible = false
			open = false
			Engine.time_scale = 1
			timer.start()

		

func reload():
	if Input.is_action_just_pressed("Reload"):
		Engine.time_scale = 1
		get_tree().reload_current_scene()


func _on_restart_pressed() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Scenes/tadle.tscn")
