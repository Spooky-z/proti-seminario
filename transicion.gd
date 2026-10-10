extends Node

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var transicion: CanvasLayer = $transicion

func change_scene(target: String) -> void:
	animation_player.play("disolver")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(target)
	animation_player.play_backwards("disolver")
