extends Node2D

@onready var start_menu = $"CanvasLayer/Start menu"
@onready var level_select = $"CanvasLayer/Level Select"
@onready var shop_select = $CanvasLayer/Shop

func _on_button_pressed_play() -> void:
	level_select.visible = true
	start_menu.visible = false
	shop_select.visible = false


func _on_button_2_pressed() -> void:
	get_tree().quit()


func _on_button_3_pressed() -> void:
	level_select.visible = false
	start_menu.visible = false
	shop_select.visible = true


func _on_menu_pressed() -> void:
	level_select.visible = false
	start_menu.visible = true
	shop_select.visible = false


func _on__level1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level 1.tscn")


func _on__level2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level 2.tscn")


func _on__level3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level 3.tscn")


func _on__level4_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level 4.tscn")
