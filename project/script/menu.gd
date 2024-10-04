extends Node2D

func _on_button_pressed_play() -> void:
	get_tree().change_scene_to_file("res://Scenes/tadle.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()
