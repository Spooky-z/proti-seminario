extends Control

@onready var option: AudioStreamPlayer2D = $option

func _on_start_pressed() -> void:
	var bus = AudioServer.get_bus_index("Musica")
	AudioServer.set_bus_mute(bus, true)
	option.play()
	Transicion.change_scene("res://Casa/casa.tscn")

func _on_quit_pressed() -> void:
	option.play()
	await get_tree().create_timer(0.2).timeout
	Transicion.change_scene("res://Menus/Menu Main/menu.tscn")
