extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.set_physics_process(false)
		var animated_sprite = body.get_node("Sprite") 
		animated_sprite.play("freeze")
