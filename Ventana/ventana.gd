extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

var isApproaching: bool
var isWatching: bool
var isLeaving: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startRandomTimer()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startRandomTimer():
	timer.wait_time = randf_range(3.0, 8.0)
	timer.start()
	print(timer.wait_time)

func warning():
	animated_sprite_2d.play("warning")

func selectRandomWindow():
	var windows = get_tree().get_nodes_in_group("windows")
	if windows.is_empty():
		return
	var chooseWindow = windows.pick_random()
	chooseWindow.Warning()

func _on_timer_timeout() -> void:
	warning()
