extends Area2D

# Прив'язуємо об'єкт Timer через ноду в сцені (припустимо, що таймер називається MyTimer)
@onready var timer = $"../../UI/Timer"  # Замість завантаження через шлях

func _on_body_entered(body) -> void:
	if !timer.is_stopped() and body.name == "Player":
			Engine.time_scale = 0
			timer.stop()
		
