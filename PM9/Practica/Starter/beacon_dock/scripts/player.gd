extends CharacterBody3D
@export var speed: float = 4.5
@export var horizontal_only: bool = false
var active: bool = false
func _physics_process(delta: float) -> void:
	if not active:
		velocity = Vector3.ZERO
		return
	var input: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if horizontal_only:
		input.y = 0.0
	var direction: Vector3 = Vector3(input.x, 0, input.y).limit_length(1.0)
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	if not is_on_floor():
		velocity.y -= 18.0 * delta
	else:
		velocity.y = 0.0
	move_and_slide()
func reset_to(value: Vector3) -> void:
	position = value
	velocity = Vector3.ZERO
