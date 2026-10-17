extends Area2D

class_name Door

@export var destination: String
@export var destination_room: String
@export var direction = "up"

@onready var marker_2d: Marker2D = $Marker2D

var enter = false
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("HAI")
		NavigationManager.got_to(destination,destination_room)

#func _on_body_exited(_body: Node2D) -> void:
	#enter = false
	#
#func _process(_delta):
	#if Input.is_action_just_pressed("interaction") and enter:
		#NavigationManager.got_to(destination,destination_room)
