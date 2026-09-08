extends RefCounted
enum Phase { READY, PLAY, PAUSED, WON, LOST }
const REQUIRED: Array[String] = ["CELL-A", "CELL-B", "CELL-C"]
var phase: Phase = Phase.READY
var remaining: float = 60.0
var lives: int = 3
var immunity: float = 0.0
var collected: Dictionary = {}
var reason: String = ""
func start() -> void:
	phase = Phase.PLAY
	remaining = 60.0
	lives = 3
	immunity = 0.0
	collected.clear()
	reason = ""
func tick(delta: float) -> void:
	if phase != Phase.PLAY or delta < 0.0:
		return
	remaining = maxf(0.0, remaining - delta)
	immunity = maxf(0.0, immunity - delta)
	if remaining <= 0.0:
		phase = Phase.LOST
		reason = "Tiempo agotado"
func collect(pickup_id: String) -> bool:
	if phase != Phase.PLAY or pickup_id not in REQUIRED or collected.has(pickup_id):
		return false
	# TODO-PM9-1: registrar una baliza válida exactamente una vez.
	return false
func hit() -> bool:
	if phase != Phase.PLAY or immunity > 0.0:
		return false
	# TODO-PM9-2: aplicar daño e inmunidad, preservando guardas.
	immunity = 0.0
	if lives <= 0:
		phase = Phase.LOST
		reason = "Sin vidas"
	return true
func deliver() -> bool:
	if phase != Phase.PLAY or collected.size() != REQUIRED.size():
		return false
	# TODO-PM9-3: cerrar victoria solo con el requisito cumplido.
	return false
func toggle_pause() -> void:
	if phase == Phase.PLAY:
		phase = Phase.PAUSED
	elif phase == Phase.PAUSED:
		phase = Phase.PLAY
