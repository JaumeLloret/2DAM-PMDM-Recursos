extends Control
enum Phase { READY, PLAY, WON, LOST }
var phase: Phase = Phase.READY
var step: int = 0
var remaining: float = 10.0
const SEQUENCE: Array[String] = ["A", "B", "A"]
func _ready() -> void:
	$Rows/Start.pressed.connect(start_round)
	$Rows/Inputs/A.pressed.connect(func() -> void: choose("A"))
	$Rows/Inputs/B.pressed.connect(func() -> void: choose("B"))
	$Rows/Back.pressed.connect(_back)
	var stream: AudioStreamWAV = AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_16_BITS
	stream.mix_rate = 22050
	var samples: PackedByteArray = PackedByteArray()
	samples.resize(2206)
	for i in range(1103):
		samples.encode_s16(i * 2, int(sin(TAU * 660.0 * i / 22050.0) * 1800.0))
	stream.data = samples
	$Tone.stream = stream
	_update_view()
func start_round() -> void:
	phase = Phase.PLAY
	step = 0
	remaining = 10.0
	_update_view()
func choose(value: String) -> void:
	if phase != Phase.PLAY:
		return
	if value != SEQUENCE[step]:
		phase = Phase.LOST
	else:
		step += 1
		$Tone.play()
		if step == SEQUENCE.size():
			phase = Phase.WON
	_update_view()
func _process(delta: float) -> void:
	if phase == Phase.PLAY:
		remaining = maxf(0.0, remaining - delta)
		if remaining <= 0.0:
			phase = Phase.LOST
		_update_view()
func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if event.physical_keycode == KEY_A:
			choose("A")
		elif event.physical_keycode == KEY_B:
			choose("B")
func _update_view() -> void:
	var label: String = ["Preparado", "En juego", "Secuencia completada", "Ronda terminada"][phase]
	$Rows/State.text = "%s · %d/3\nRepite A → B → A antes del límite" % [label, step]
	$Rows/Time.text = "Tiempo: %.1f s" % remaining
	$Rows/Inputs/A.disabled = phase != Phase.PLAY
	$Rows/Inputs/B.disabled = phase != Phase.PLAY
func _back() -> void:
	get_tree().change_scene_to_file("res://scenes/lab3d.tscn")
