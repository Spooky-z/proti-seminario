extends Control

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var play: AudioStreamPlayer2D = $play
@onready var option: AudioStreamPlayer2D = $option

func _ready():
	color_rect.visible = false

func _on_start_pressed() -> void:
	play.play()
	var bus = AudioServer.get_bus_index("Musica")
	AudioServer.set_bus_mute(bus, true)
	color_rect.visible = true
	animation_player.play("interaction")
	await get_tree().create_timer(2).timeout
	Transicion.change_scene("res://Menus/Carga/loading.tscn")
	

func _on_settings_pressed() -> void:
	option.play()
	Transicion.change_scene("res://Menus/settings/settings.tscn")

func _on_quit_pressed() -> void:
	option.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
