extends HSlider


@export var audio_bus_name: String
var audio_bus_id

func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	if Config.volumenes.has(audio_bus_name):
		value = Config.volumenes[audio_bus_name]
	else:
		Config.volumenes[audio_bus_name] = value
	aplicar_volumen(value)

func _on_value_changed(value: float) -> void:
	Config.volumenes[audio_bus_name] = value
	aplicar_volumen(value)

func aplicar_volumen(value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id,db)
