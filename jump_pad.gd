extends Area2D

@export var jump_strength: float = 600

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is CharacterBody2D:
		body.velocity.y = -jump_strength
