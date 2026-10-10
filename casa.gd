extends Node2D



func _ready() -> void:
	var bus = AudioServer.get_bus_index("Musica")
	AudioServer.set_bus_mute(bus, true)
