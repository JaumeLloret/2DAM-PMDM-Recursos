extends Node3D
const Rules = preload("res://scripts/rules.gd")
const START: Vector3 = Vector3(-4, 0.7, 4)
var rules: Rules = Rules.new()
var message: String = "Recoge las tres esferas y vuelve al muelle. Evita los conos."
func _ready() -> void:
	_install_input()
	$Camera.look_at(Vector3.ZERO)
	for cell: Area3D in $Pickups.get_children():
		cell.body_entered.connect(_on_pickup.bind(cell))
	for hazard: Area3D in $Hazards.get_children():
		hazard.body_entered.connect(_on_hazard)
	$Goal.body_entered.connect(_on_goal)
	$HUD/Actions/Start.pressed.connect(_restart)
	$HUD/Actions/Pause.pressed.connect(_toggle_pause)
	$HUD/Actions/Mute.pressed.connect(_mute)
	get_viewport().size_changed.connect(_layout_controls)
	_layout_controls()
	_sync_simulation()
	_update_view()
func _process(delta: float) -> void:
	var before: int = rules.phase
	rules.tick(delta)
	if before != rules.phase and rules.phase == Rules.Phase.LOST:
		$Tone.play_event("lose")
	_sync_simulation()
	for cell: Area3D in $Pickups.get_children():
		cell.set_process(rules.phase == Rules.Phase.PLAY)
	_update_view()
func _restart() -> void:
	rules.start()
	$Player.reset_to(START)
	_clear_input()
	for cell: Area3D in $Pickups.get_children():
		cell.visible = true
		cell.set_deferred("monitoring", true)
	message = "Tres esferas → muelle. Flechas/WASD o controles en pantalla."
	_sync_simulation()
	_update_view()
func _on_pickup(body: Node3D, cell: Area3D) -> void:
	if body == $Player and rules.collect(cell.pickup_id):
		cell.visible = false
		cell.set_deferred("monitoring", false)
		message = "Baliza recogida. Quedan %d." % (3 - rules.collected.size())
		$Tone.play_event("collect")
		_update_view()
func _on_hazard(body: Node3D) -> void:
	if body == $Player and rules.hit():
		$Player.call_deferred("reset_to", START)
		message = "Contacto con peligro. Vuelve a intentarlo desde el inicio."
		$Tone.play_event("lose" if rules.phase == Rules.Phase.LOST else "hit")
		_sync_simulation()
		_update_view()
func _on_goal(body: Node3D) -> void:
	if body != $Player or rules.phase != Rules.Phase.PLAY:
		return
	if rules.deliver():
		message = "Entrega completada. Puedes iniciar otra ronda."
		$Tone.play_event("win")
	else:
		message = "Necesitas las tres esferas antes de entregar."
	_sync_simulation()
	_update_view()
func _toggle_pause() -> void:
	rules.toggle_pause()
	_clear_input()
	_sync_simulation()
	if rules.phase == Rules.Phase.PLAY:
		for cell: Area3D in $Pickups.get_children():
			if cell.overlaps_body($Player):
				_on_pickup($Player, cell)
		if $Goal.overlaps_body($Player):
			_on_goal($Player)
	_update_view()
func _update_view() -> void:
	var phase_text: String = ["Preparado", "En juego", "Pausa", "Victoria", "Fin de ronda"][rules.phase]
	$HUD/Top/Rows/Title.text = "Balizas del muelle · " + phase_text
	$HUD/Top/Rows/Stats.text = "Balizas %d/3 · Vidas %d · Tiempo %.1f s" % [rules.collected.size(), rules.lives, rules.remaining]
	$HUD/Top/Rows/Message.text = rules.reason if rules.phase in [Rules.Phase.WON, Rules.Phase.LOST] else message
	$HUD/Actions/Pause.text = "Continuar" if rules.phase == Rules.Phase.PAUSED else "Pausa"
	$HUD/Actions/Pause.disabled = rules.phase not in [Rules.Phase.PLAY, Rules.Phase.PAUSED]

func _install_input() -> void:
	var keys: Dictionary = {"move_left": [KEY_A, KEY_LEFT], "move_right": [KEY_D, KEY_RIGHT], "move_up": [KEY_W, KEY_UP], "move_down": [KEY_S, KEY_DOWN]}
	for action: String in keys:
		if not InputMap.has_action(action):
			InputMap.add_action(action)
		for code: int in keys[action]:
			var event: InputEventKey = InputEventKey.new()
			event.physical_keycode = code
			if not InputMap.action_has_event(action, event):
				InputMap.action_add_event(action, event)
func _clear_input() -> void:
	for action in ["move_left", "move_right", "move_up", "move_down"]:
		Input.action_release(action)
func _layout_controls() -> void:
	var size: Vector2 = get_viewport().get_visible_rect().size
	$HUD/TouchControls.position = Vector2(16, maxf(120.0, size.y - 212.0))
func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo and event.physical_keycode in [KEY_P, KEY_ESCAPE]:
		_toggle_pause()
func _notification(what: int) -> void:
	if is_node_ready() and what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		if rules.phase == Rules.Phase.PLAY:
			_toggle_pause()
		_clear_input()
func _mute() -> void:
	$Tone.toggle_mute()
	$HUD/Actions/Mute.text = "Activar sonido" if $Tone.muted else "Silenciar"
func _sync_simulation() -> void:
	$Player.active = rules.phase == Rules.Phase.PLAY
