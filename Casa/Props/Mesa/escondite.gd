extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.puede_esconderse = true
		


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.puede_esconderse = false
		
