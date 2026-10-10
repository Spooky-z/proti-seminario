extends Control


@onready var option_button: OptionButton = $VBoxContainer/VBoxContainer/OptionButton
const window_mode_array: Array[String] = [
	"ventana", 
	"pantalla completa",
]

func _ready() -> void:
	option_button.item_selected.connect(on_window_mode_seleccted)

func add_window_mode_item()-> void:
	for window_mode in window_mode_array:
		option_button.add_item(window_mode)

func on_window_mode_seleccted (index:int)-> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_button_pressed() -> void:
	Transicion.change_scene("res://Menus/Menu Main/menu.tscn")

func _on_mute_toggled(_toggled_on: bool) -> void:
	var bus_master = AudioServer.get_bus_index("Musica")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))

func _on_mute_global_toggled(_toggled_on: bool) -> void:
	var bus_master = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))

func _on_sfx_mute_toggled(_toggled_on: bool) -> void:
	var bus_master = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))
