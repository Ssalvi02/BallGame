extends Camera3D

@export var target_node: NodePath  # Atribua a bola no Inspector
@export var lerp_speed: float = 5.0
@export var zoom_sensitivity: float = 0.5

var _target: Node3D

func _ready():
	_target = get_node(target_node)
	projection = Camera3D.PROJECTION_ORTHOGONAL
	rotation_degrees = Vector3(-90, 0, 0)

func _process(delta):
	if _target:
		# Segue a posição X/Z da bola, mantendo Y fixo
		var target_pos = Vector3(_target.global_position.x, position.y, _target.global_position.z)
		global_position = global_position.lerp(target_pos, lerp_speed * delta)

		# Zoom opcional (com pinch gesture)
		if Input.is_action_pressed("zoom_in"):
			size -= zoom_sensitivity
		if Input.is_action_pressed("zoom_out"):
			size += zoom_sensitivity
		size = clamp(size, 5, 20)
