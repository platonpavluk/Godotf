extends Area2D
@onready var Score = $"../../UI/CanvasLayer/Score"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.freeze_player()
		var animated_sprite = body.get_node("Sprite") 
		animated_sprite.play("freeze")
		Engine.time_scale = 0
		Score.visible = true
