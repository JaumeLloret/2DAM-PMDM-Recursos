extends Area3D
@export var pickup_id: String = "CELL-A"
func _process(delta: float) -> void:
	$Mesh.rotate_y(delta)
