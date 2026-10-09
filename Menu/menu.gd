extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Carga/loading.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://settings/settings.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
