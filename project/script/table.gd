extends Node2D





func _on_1_level_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level 1.tscn")
	
func _on_2_level_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level 2.tscn")
	



func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_3_level_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level 3.tscn")
	
	


func _on__level_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level 4.tscn")
