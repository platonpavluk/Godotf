extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		body.SPEED = body.base_speed + 35
		body.JUMP_VELOCITY = 205

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.spedometer.set_wait_time(body.spedometer.get_time_left() + 1.6)
		body.spedometer.start() 
		queue_free()  
