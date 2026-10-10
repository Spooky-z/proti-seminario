extends CharacterBody2D


const SPEED = 200
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D
var puede_esconderse: bool = false 

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
	
	esconderce()
	move_and_slide()
 

func esconderce():
	var direction := Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	
	
	
	if Input.is_action_pressed("agacharse") and puede_esconderse:
		velocity = direction * 0
		animated_sprite_2d.play("hide")
		point_light_2d.visible = false
	else: 
		point_light_2d.visible = true
