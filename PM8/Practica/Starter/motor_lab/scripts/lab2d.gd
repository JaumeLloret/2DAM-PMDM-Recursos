extends Node2D
var rotating: bool = false
@onready var pivot: Node2D = $Pivot
@onready var probe: Polygon2D = $Pivot/Probe
func _ready() -> void:
	$HUD/Panel/Rows/Game.pressed.connect(_open_game)
	$HUD/Panel/Rows/Rotate.pressed.connect(_toggle_rotation)
	$HUD/Panel/Rows/Switch.pressed.connect(_switch_scene)
	$HUD/Panel/Rows/Reset.pressed.connect(_reset_scene)
func _process(delta: float) -> void:
	if rotating:
		pivot.rotate(delta)
	$HUD/Panel/Rows/Status.text = "Probe local %s\nGlobal %s\n2D: Y crece hacia abajo" % [probe.position, probe.global_position]
func _toggle_rotation() -> void:
	rotating = not rotating
func _switch_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/lab3d.tscn")
func _reset_scene() -> void:
	get_tree().reload_current_scene()

func _open_game() -> void:
	get_tree().change_scene_to_file("res://scenes/signal_game.tscn")
