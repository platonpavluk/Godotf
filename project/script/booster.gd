extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		body.SPEED = body.base_speed + 40  

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.spedometer.set_wait_time(1.6)
		body.spedometer.start() 
