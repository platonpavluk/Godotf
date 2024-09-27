extends CharacterBody2D

var base_speed = 150.0
var SPEED = base_speed
const JUMP_VELOCITY = 200.0
const GRAVITY = 500.0  # Гравітація

var jump_count = 0
var max_jumps = 2
var direction 

var frozen: bool = false

@onready var animation = $Sprite

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		jump_count = 0

	if frozen:
		animation.play("freeze")
		move_and_slide()
		return

	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jumps:
		velocity.y = -JUMP_VELOCITY
		jump_count += 1

	direction = Input.get_axis("Left", "Right")

	if direction != 0:
		velocity.x = direction * SPEED
		animation.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("idle")
		
	if direction < 0:
		animation.flip_h = true
	elif direction > 0:
		animation.flip_h = false

	move_and_slide()

func freeze_player():
	frozen = true
	velocity.x = 0  # Заморожуємо тільки горизонтальний рух

func unfreeze_player():
	frozen = false
