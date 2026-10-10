extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var detectionRange: Area2D = $Area2D

static var busy := false

var isApproachingWindow: bool
var isWatching: bool
var isLeaving: bool

var player: CharacterBody2D = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	busy = false
	timer.one_shot = true
	startRandomTimer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startRandomTimer():
	timer.wait_time = randf_range(1.0, 8.0)
	timer.start()

#func selectRandomWindow():
	#var windows = get_tree().get_nodes_in_group("windows")
	#if windows.is_empty():
		#return
	#var chooseWindow = windows.pick_random()
	#chooseWindow.Warning()

func _on_timer_timeout() -> void:
	if not busy:
		busy = true
		await crocodileCycle()
		busy = false
	startRandomTimer()

func crocodileCycle():
	warning()
	await get_tree().create_timer(1.0).timeout
	attacking()
	await get_tree().create_timer(1.0).timeout
	retreating()
	await get_tree().create_timer(1.0).timeout
	idle()
	
func warning():
	isWatching = false
	isApproachingWindow = true
	animated_sprite_2d.play("warning")

func attacking():
	isApproachingWindow = false
	isWatching = true
	animated_sprite_2d.play("scoobydrilo")
	if player != null and player.is_in_group("player"):
		player.queue_free()
		player = null
		Transicion.change_scene("res://Game Over/gameover.tscn")
		
func retreating():
	isWatching = false
	isLeaving = true
	animated_sprite_2d.play("warning")
	
func idle():
	isLeaving = false
	animated_sprite_2d.play("idle")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player:
		player = null
