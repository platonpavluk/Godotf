extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		if is_instance_valid($CanvasGroup/MenuBar):
			hide_menu()
		else:
			show_menu()

func show_menu():
	$CanvasGroup/MenuBar.show()

func hide_menu():
	$CanvasGroup/MenuBar.hide()

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
