extends Node

# Глобальні змінні
var score: int = 0
var save_file_path: String = "user://save_game.cfg"

# Завантаження гри при старті
func _ready() -> void:
	# Коли сцена завантажується, завантажуємо дані гри
	load_game()

# Автоматичне збереження гри при виході
func _notification(what):
	if what == NOTIFICATION_EXIT_TREE:  # Сигнал про вихід із дерева сцени (гра закривається)
		save_game()

# Функція для збереження гри
func save_game() -> void:
	var config = ConfigFile.new()
	config.set_value("player_data", "score", score)  # Зберігаємо score в розділі player_data
	
	var error = config.save(save_file_path)  # Зберігаємо файл
	if error == OK:
		print("Game saved successfully!")
	else:
		print("Error saving the game: ", error)

# Функція для завантаження гри
func load_game() -> void:
	var config = ConfigFile.new()
	var error = config.load(save_file_path)
	
	if error == OK:
		score = config.get_value("player_data", "score", 0)  # Завантажуємо score з файлу
		print("Game loaded successfully!")
	else:
		print("Error loading the game or file does not exist: ", error)
