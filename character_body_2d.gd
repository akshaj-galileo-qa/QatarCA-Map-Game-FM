extends CharacterBody2D

# Movement settings
@export var speed: float = 300.0
@export var jump_force: float = -500.0
@export var gravity: float = 1200.0

# Player sprite
@onready var player_sprite: Sprite2D = $Qplayer


func _physics_process(delta: float) -> void:

	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get movement input
	var direction = Input.get_axis("ui_left", "ui_right")

	# Move left and right
	velocity.x = direction * speed

	# Flip sprite depending on direction
	if direction < 0:
		player_sprite.flip_h = true
	elif direction > 0:
		player_sprite.flip_h = false

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force

	# Move player and handle collisions
	move_and_slide()
