extends CharacterBody2D

@onready var target = "res://Jugador/pj.tscn"

const SPEED = 150.0

func _physics_process(delta: float) -> void:
	var direction = (target.position - position).normalized()
	velocity = direction * SPEED
	look_at(target.position)


	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
