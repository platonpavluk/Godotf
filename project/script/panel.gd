extends Node2D
@onready var Score = $CanvasLayer/Score
@onready var timer = $Timer
var open = false

func _physics_process(delta: float) -> void:
	reload()
	if Input.is_action_just_pressed("Menu"):
		if open == true:
			timer.start()
			Score.visible = false
			open = false
		else:
				timer.stop()
				Score.visible = true
				open = true

		

func reload():
	if Input.is_action_just_pressed("Reload"):
		get_tree().reload_current_scene()


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tadle.tscn")
