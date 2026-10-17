extends Node

const BEDROOM = preload("uid://dpujpn4plc01y")
const BATHROOM = preload("uid://cl88w0dbdta07")
const HALL = preload("uid://dbep3apurniiy")

signal on_trigger_player_spawn

var spawn_tag

func got_to(room_tag, destination_tag):
	var scene_to_load
	
	match room_tag:
		"bedroom":
			scene_to_load = BEDROOM
		"bathroom":
			scene_to_load = BATHROOM
		"hall":
			scene_to_load = HALL
	if scene_to_load != null:
		spawn_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)

func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position,direction)
