extends Control


func _ready() -> void:
	pass

func _on_button_pressed() -> void:
	Transicion.change_scene("res://Menu/menu.tscn")

func _on_mute_toggled(_toggled_on: bool) -> void:
	var bus_master = AudioServer.get_bus_index("Musica")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))

func _on_mute_global_toggled(_toggled_on: bool) -> void:
	var bus_master = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))

func _on_sfx_mute_toggled(_toggled_on: bool) -> void:
	var bus_master = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))
