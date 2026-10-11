extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	animation_player.play("fadeo")
	get_tree().create_timer(3).timeout.connect(reversa)
func reversa():
	animation_player.play_backwards("fadeo")
	get_tree().create_timer(3).timeout.connect(menu)
func menu():
	Transicion.change_scene("res://Menus/Menu Main/menu.tscn")
