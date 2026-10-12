extends Node2D

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@export var siguienteEscena: String = "res://Casa/cuarto.tscn"
var progreso: Array[float] = []

func _ready():
	ResourceLoader.load_threaded_request(siguienteEscena)
	
func _process(_delta):
	var status = ResourceLoader.load_threaded_get_status(siguienteEscena,progreso)
	
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			var porc = progreso[0] * 100
			texture_progress_bar.value = porc
		ResourceLoader.THREAD_LOAD_LOADED:
			var scene = ResourceLoader.load_threaded_get(siguienteEscena)
			get_tree().change_scene_to_packed(scene)
