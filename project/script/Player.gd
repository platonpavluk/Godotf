extends CharacterBody2D

var base_speed = 150.0
var SPEED = base_speed
const JUMP_VELOCITY = 190.0
const GRAVITY = 650.0  # Гравітація

var jump_count = 0
var max_jumps = 2
var direction
var frozen: bool = false

@onready var animation = $Sprite  # Ваш AnimatedSprite




func _physics_process(delta: float) -> void:
	# Застосування гравітації
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		jump_count = 0  # Скидаємо лічильник стрибків, коли на підлозі

	if frozen:
		animation.play("freeze")  # Граємо анімацію замороження
		move_and_slide()  # Переміщуємо без руху
		return

	# Перевірка на стрибок
	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jumps:
		velocity.y = -JUMP_VELOCITY
		jump_count += 1

	# Отримання напрямку
	direction = Input.get_axis("Left", "Right")

	# Обробка руху
	if direction != 0 and Engine.time_scale == 1 :
		velocity.x = direction * SPEED
		animation.play("run")  # Граємо анімацію бігу
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)  # Гальмування до нуля
		animation.play("idle")  # Граємо анімацію спокою

	# Встановлюємо напрямок для відображення
	animation.flip_h = direction < 0 and Engine.time_scale == 1 # Зворотне відображення для лівого напрямку

	move_and_slide()  # Переміщення



func freeze_player():
	frozen = true
	velocity.x = 0  # Заморожуємо тільки горизонтальний рух

func unfreeze_player():
	frozen = false  # Розморожуємо
