extends Control


func _on_start_pressed() -> void:
	Transicion.change_scene("res://casa.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
