extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const FALL = 9
var falling = 0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		falling += 1
		
	if is_on_floor():
		falling=0;
	# Handle jump.
	if Input.is_action_just_pressed("jump") and falling<FALL:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if direction < 0:
		sprite.flip_h = false
	elif direction > 0:
		sprite.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			sprite.play("Idle")
		else:
			sprite.play("Run")
	else:
		if velocity.y < 0:
			sprite.play("Jump")
		else:
			sprite.play("Fall")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
