extends Area2D
@onready var player = $"../../Player"

func _on_body_entered(body):
	if body.name == "Player":
		player.SPEED = player.base_speed + 50

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		self.visible = false
		await get_tree().create_timer(1.6).timeout
		player.SPEED = player.base_speed
		queue_free()
