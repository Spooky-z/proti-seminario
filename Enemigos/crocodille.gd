extends CharacterBody2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var target = $"../CharacterBody2D"

const SPEED = 25.0

func _physics_process(delta: float) -> void:
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func _on_vision_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var direction = (target.position - position).normalized()
		velocity = direction * SPEED
	pass # Replace with function body.
