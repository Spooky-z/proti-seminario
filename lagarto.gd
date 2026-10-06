extends CharacterBody2D

enum Estado { PATRULLANDO, MIRANDO }

@export var velocidad := 90
@export var tiempo_mirando := 4.0
@export var puntos_patrulla: Array[Marker2D] = []

var estado := Estado.PATRULLANDO
var indice := 0
var ventana_ignorada: Area2D = null

@onready var vision: Area2D = $vision
@onready var forma_vision: CollisionShape2D = $vision/CollisionShape2D
@onready var sensor: Area2D = $sensorVentana
@onready var temporizador: Timer = $Timer

func _ready() -> void:
	forma_vision.disabled = true
	sensor.area_entered.connect(_on_sensor_area_entered)
	sensor.area_exited.connect(_on_sensor_area_exited)
	vision.body_entered.connect(_on_vision_body_entered)
	temporizador.timeout.connect(_on_temporizador_timeout)

func _physics_process(_delta: float) -> void:
	if estado == Estado.PATRULLANDO:
		_patrullar()
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func _patrullar() -> void:
	if puntos_patrulla.is_empty():
		return
	var diferencia := puntos_patrulla[indice].global_position.x - global_position.x
	if absf(diferencia) < 4.0:
		indice = (indice + 1) % puntos_patrulla.size()
		return
	var dir := signf(diferencia)
	velocity = Vector2(dir * velocidad, 0)
	$Sprite2D.flip_h = dir < 0

func _on_sensor_area_entered(area: Area2D) -> void:
	if estado == Estado.PATRULLANDO and area.is_in_group("ventanas") and area != ventana_ignorada:
		estado = Estado.MIRANDO
		ventana_ignorada = area
		forma_vision.set_deferred("disabled", false)
		temporizador.start(tiempo_mirando)

func _on_sensor_area_exited(area: Area2D) -> void:
	if area == ventana_ignorada:
		ventana_ignorada = null

func _on_temporizador_timeout() -> void:
	forma_vision.set_deferred("disabled", true)
	estado = Estado.PATRULLANDO

func _on_vision_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		print("¡Te vio!")
