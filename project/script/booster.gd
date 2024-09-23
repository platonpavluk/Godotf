extends Area2D

@onready var player_scene = preload("res://Scenes/player.tscn")  

func _on_body_entered(body):
	if body.name == "Player":
		body.SPEED = body.base_speed + 50

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		await get_tree().create_timer(1.6).timeout
		body.SPEED = body.base_speed
