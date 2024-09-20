extends Area2D

# Прив'язуємо об'єкт Timer через ноду в сцені (припустимо, що таймер називається MyTimer)
@onready var timer = $CanvasLayer/Label  # Замість завантаження через шлях

func _on_body_entered(body: Node2D) -> void:
	if timer and not timer.is_stopped():  # Перевірка, чи таймер існує та не зупинений
		timer.stop()  # Зупиняємо таймер
