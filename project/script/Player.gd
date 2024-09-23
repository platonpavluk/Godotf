extends CharacterBody2D

var base_speed = 150.0
var SPEED = base_speed
const JUMP_VELOCITY = 200.0

# Jump
var jump_count = 0
var max_jumps = 2
var direction 
@onready var animation = $Sprite

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		jump_count = 0
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jumps:
		velocity.y = -JUMP_VELOCITY
		jump_count += 1

	var direction := Input.get_axis("Left", "Right")
	animation.play("run")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("idle")
		
	if direction < 0:
		animation.flip_h = true
	elif direction > 0:
		animation.flip_h = false
		

		
	move_and_slide()
	
func dead():
	queue_free()
