extends CharacterBody2D


const SPEED = 200
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		animated_sprite_2d.play("walk")
		if direction.x > 0:
			point_light_2d.rotation = -PI/2
			animated_sprite_2d.flip_h = true
		elif direction.x < 0:
			point_light_2d.rotation = PI/2
			animated_sprite_2d.flip_h = false
	else:
		velocity = Vector2.ZERO
		animated_sprite_2d.play("idle")

	move_and_slide()
