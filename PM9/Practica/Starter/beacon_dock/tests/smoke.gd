extends SceneTree
const Rules = preload("res://scripts/rules.gd")
func _initialize() -> void:
	var rules: Rules = Rules.new()
	assert(rules.phase == Rules.Phase.READY)
	rules.start()
	assert(rules.phase == Rules.Phase.PLAY)
	var time: float = rules.remaining
	rules.toggle_pause()
	rules.tick(1.0)
	assert(rules.remaining == time)
	print("PASS_SMOKE: baseline only, not game acceptance")
	quit()
