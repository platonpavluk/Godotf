extends Node2D

# Завантажуємо сцену гравця
var player_scene = preload("res://Scenes/player.tscn")
var player_instance: Node = null  # Створюємо змінну для інстансу гравця

# Викликається при вході в сцену
func _ready() -> void:
	$coins.text = str(Global.score) + " Coin"
	
	# Інстанціюємо гравця, якщо це рівень
	if _is_level_scene():
		instantiate_player()

# Функція для перевірки, чи це рівень
func _is_level_scene() -> bool:
	var current_scene = get_tree().current_scene
	if current_scene != null:
		# Отримуємо шлях до файлу сцени
		var scene_path = current_scene.get_scene_file_path()
		# Перевіряємо, чи шлях містить "level"
		return scene_path.find("level") != -1
	return false

# Інстанціюємо гравця і додаємо його в сцену
func instantiate_player() -> void:
	player_instance = player_scene.instantiate()
	add_child(player_instance)

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_button_pressed() -> void:
	if Global.score >= 100:
		Global.score -= 100
		
		# Перевіряємо, чи інстанс гравця вже існує
		if player_instance != null:
			var player_animator = player_instance.get_node_or_null("AnimatedSprite")
			
			# Перевіряємо, чи аніматор існує
			if player_animator != null:
				player_animator.load("res://player2.tres")
			else:
				print("AnimatedSprite не знайдено!")
		else:
			print("Гравця не інстанційовано!")

		
