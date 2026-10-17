extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Transicion.change_scene("res://Menus/Win/win.tscn")
	
