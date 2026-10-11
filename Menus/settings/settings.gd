extends Control

@onready var option: AudioStreamPlayer2D = $option
@onready var option_button: OptionButton = $VBoxContainer/VBoxContainer/OptionButton
@onready var mute: CheckBox = $VBoxContainer/VBoxContainer/HBoxContainer/CheckBox
@onready var mute_global: CheckBox = $VBoxContainer/VBoxContainer/HBoxContainer3/CheckBox
@onready var sfx_mute: CheckBox = $VBoxContainer/VBoxContainer/HBoxContainer2/CheckBox
@onready var ambience_mute: CheckBox = $VBoxContainer/VBoxContainer/HBoxContainer4/CheckBox

const window_mode_array: Array[String] = [
	"Windowed", 
	"Fullscreen",
]

func _ready() -> void:
	add_window_mode_item()
	option_button.item_selected.connect(on_window_mode_seleccted)
	mute.button_pressed = Config.musica_muted
	mute_global.button_pressed = Config.master_muted
	sfx_mute.button_pressed = Config.sfx_muted
	ambience_mute.button_pressed = Config.ambience_muted
	option_button.select(Config.window_mode)

func add_window_mode_item()-> void:
	for window_mode in window_mode_array:
		option_button.add_item(window_mode)

func on_window_mode_seleccted (index:int)-> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_button_pressed() -> void:
	option.play()
	Transicion.change_scene("res://Menus/Menu Main/menu.tscn")

func _on_mute_toggled(_toggled_on: bool) -> void:
	Config.musica_muted = _toggled_on
	var bus_master = AudioServer.get_bus_index("Musica")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))

func _on_mute_global_toggled(_toggled_on: bool) -> void:
	Config.muted_global = _toggled_on
	var bus_master = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))

func _on_sfx_mute_toggled(_toggled_on: bool) -> void:
	Config.sfx_muted = _toggled_on
	var bus_master = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))

func _on_ambience_mute_toggled(_toggled_on: bool) -> void:
	Config.ambience_muted = _toggled_on
	var bus_master = AudioServer.get_bus_index("Ambience")
	AudioServer.set_bus_mute(bus_master, not AudioServer.is_bus_mute(bus_master))
