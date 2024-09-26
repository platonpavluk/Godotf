extends Node2D
@onready var Score = $CanvasLayer/Score
@onready var timer = $Timer
var open = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		if open == true:
			if timer.is_stopped():
				Score.visible = false
				open = false
			else:
				Score.visible = false
				open = false
				timer.start()
		else:
				open = true
				Score.visible = true

		

func reload():
	if Input.is_action_just_pressed("Reload"):
		get_tree().reload_current_scene()


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tadle.tscn")
