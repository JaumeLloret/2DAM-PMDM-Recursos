extends AudioStreamPlayer
var muted: bool = false
var streams: Dictionary = {}
func _ready() -> void:
	for event in ["collect"]:
		var frequency: float = {"collect": 740.0, "hit": 180.0, "win": 990.0, "lose": 110.0}[event]
		var audio: AudioStreamWAV = AudioStreamWAV.new()
		audio.format = AudioStreamWAV.FORMAT_16_BITS
		audio.mix_rate = 22050
		var data: PackedByteArray = PackedByteArray()
		data.resize(6616)
		for i in range(3308):
			var envelope: float = 1.0 - float(i) / 3308.0
			data.encode_s16(i * 2, int(sin(TAU * frequency * i / 22050.0) * 2300.0 * envelope))
		audio.data = data
		streams[event] = audio
func play_event(event: String) -> void:
	if muted or not streams.has(event):
		return
	stream = streams[event]
	play()
func toggle_mute() -> void:
	muted = not muted
	if muted:
		stop()
