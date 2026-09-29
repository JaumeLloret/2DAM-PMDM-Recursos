extends Node3D
var rotating: bool = false
var sensor_entries: int = 0
@onready var pivot: Node3D = $Pivot
@onready var probe: MeshInstance3D = $Pivot/Probe
@onready var status: Label = $HUD/Panel/Rows/Status
func _ready() -> void:
	$HUD/Panel/Rows/Game.pressed.connect(_open_game)
	$Camera.look_at(Vector3(0, 0.5, 0))
	$Sensor.body_entered.connect(_on_sensor)
	$HUD/Panel/Rows/Rotate.pressed.connect(_toggle_rotation)
	$HUD/Panel/Rows/Switch.pressed.connect(_switch_scene)
	$HUD/Panel/Rows/Reset.pressed.connect(_reset_scene)
func _process(delta: float) -> void:
	if rotating:
		pivot.rotate_y(delta)
	status.text = "Probe local %s\nGlobal %s\nEntradas sensor: %d" % [probe.position, probe.global_position, sensor_entries]
func _on_sensor(body: Node3D) -> void:
	if body == $SampleBody:
		sensor_entries += 1
func _toggle_rotation() -> void:
	rotating = not rotating
func _switch_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/lab2d.tscn")
func _reset_scene() -> void:
	get_tree().reload_current_scene()

func _open_game() -> void:
	get_tree().change_scene_to_file("res://scenes/signal_game.tscn")
