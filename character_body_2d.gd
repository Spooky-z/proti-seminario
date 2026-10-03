extends CharacterBody2D

@export var velocidad := 190

var escondido := false
var zonas_cercanas := 0  # cuántas zonas de escondite está tocando

func _ready() -> void:
	add_to_group("jugador")

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("esconderse"):
		if escondido:
			_salir_del_escondite()
		elif zonas_cercanas > 0:
			_esconderse()

	if escondido:
		velocity = Vector2.ZERO
	else:
		velocity = Input.get_vector("izquierda", "derecha", "arriba", "abajo") * velocidad
	move_and_slide()

func _esconderse() -> void:
	escondido = true
	modulate.a = 0.4  # se ve semitransparente para que notes que estás oculto

func _salir_del_escondite() -> void:
	escondido = false
	modulate.a = 1.0
