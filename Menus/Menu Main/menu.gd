extends Control

@onready var color_rect: ColorRect = $ColorRect
@onready var interaccion: AnimationPlayer = $Interaccion
@onready var play: AudioStreamPlayer2D = $play
@onready var option: AudioStreamPlayer2D = $option
@export var link_itch: String
@export var link_importante: String
@onready var music: AudioStreamPlayer2D = $music
@onready var start: TextureRect = $start
@onready var intro: AnimationPlayer = $Intro
@onready var menu_art: TextureRect = $MenuArt

func _ready() -> void:
	music.play()
	color_rect.visible = false
	start.visible = false
	intro.play("intro")

func _on_start_pressed() -> void:
	play.play()
	music.stop()
	menu_art.visible = false
	color_rect.visible = true
	start.visible = true
	interaccion.play("interaction")
	await get_tree().create_timer(2).timeout
	Transicion.change_scene("res://Menus/Carga/loading.tscn")

func _on_settings_pressed() -> void:
	option.play()
	Transicion.change_scene("res://Menus/settings/settings.tscn")

func _on_quit_pressed() -> void:
	option.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_itch_pressed() -> void:
	OS.shell_open(link_itch)

func _on_button_pressed() -> void:
	OS.shell_open(link_importante)
