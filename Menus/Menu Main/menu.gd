extends Control


func _on_start_pressed() -> void:
	Transicion.change_scene("res://Menus/Carga/loading.tscn")

func _on_settings_pressed() -> void:
	Transicion.change_scene("res://Menus/settings/settings.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
