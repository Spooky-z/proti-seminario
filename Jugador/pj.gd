extends CharacterBody2D


const SPEED = 200
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var llorona: AudioStreamPlayer2D = $AudioStreamPlayer2D2
@onready var hide_input: TextureRect = $hideInput
var hiding = false
var og_pos: Vector2
var puede_esconderse: bool = false 

func _ready():
	hide_input.visible = false
	og_pos = global_position

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		animated_sprite_2d.play("walk")
		if not audio_stream_player_2d.playing:
			audio_stream_player_2d.play()
		if direction.x > 0:
			point_light_2d.rotation = -PI/2
			animated_sprite_2d.flip_h = true
		elif direction.x < 0:
			point_light_2d.rotation = PI/2
			animated_sprite_2d.flip_h = false
	else:
		velocity = Vector2.ZERO
		animated_sprite_2d.play("idle")
		audio_stream_player_2d.stop()
	if hiding:
		velocity = Vector2.ZERO
	volver()
	esconderse()
	move_and_slide()
 
#func _input(event):
	#var direction := Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	#if puede_esconderse:
		#hide_input.visible = true
	#else:
		#hide_input.visible = false
	#if event.is_action_pressed("agacharse") and puede_esconderse:
		#var objetos = get_tree().get_nodes_in_group("hiding_spots")
		#if objetos.size() > 0:
			#var objeto = objetos[0]
			#if not hiding:
				#og_pos = global_position
				#global_position = objeto.global_position + Vector2(0, 0)
				#hiding = true
				#point_light_2d.visible = false
				#z_index = -1
				#velocity = direction * 0
				#if not llorona.playing:
					#llorona.play()
			#else:
				#global_position = og_pos
				#z_index = 0
				#point_light_2d.visible = true
				#hiding = false
				#llorona.stop()


func volver():
	if Input.is_action_just_pressed("esc"):
		Transicion.change_scene("res://Menus/Menu Main/menu.tscn")

func esconderse():
	var direction := Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	if puede_esconderse:
		hide_input.visible = true
	else:
		hide_input.visible = false
	if Input.is_action_pressed("agacharse") and puede_esconderse:
		velocity = direction * 0
		animated_sprite_2d.play("hiding")
		#await get_tree().create_timer(0.5).timeout
		hide_input.visible = false
		audio_stream_player_2d.stop()
		point_light_2d.visible = false
		remove_from_group("player")
		if not llorona.playing:
			llorona.play()
		animated_sprite_2d.play("hide")
		pass
	else: 
		add_to_group("player")
		point_light_2d.visible = true
		llorona.stop()
