extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.freeze_player()
		var animated_sprite = body.get_node("Sprite") 
		animated_sprite.play("freeze")
		Engine.time_scale = 0


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.unfreeze_player()
