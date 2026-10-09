extends Control



func _ready() -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/menu.tscn")


func _on_mute_toggled(toggled_on: bool) -> void:
	var bus_master = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))
