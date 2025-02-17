extends Node3D

@export var rotation_speed = 0.5
@export var max_angle = 20.0 # Ângulo máximo de inclinação
var angular_velocity = Vector3.ZERO
var last_rotation = Vector3.ZERO

func _process(delta):
	if OS.has_feature("mobile"):
		# Usar sensores do dispositivo
		var accelerometer = Input.get_accelerometer() 
		
		# Combinar dados dos sensores para rotação mais precisa
		var target_rotation = Vector3(
			deg_to_rad(-accelerometer.y * rotation_speed),
			0,
			deg_to_rad(-accelerometer.x * rotation_speed)
		)
		
		# Limitar ângulo máximo
		target_rotation.x = clamp(target_rotation.x, deg_to_rad(-max_angle), deg_to_rad(max_angle))
		target_rotation.z = clamp(target_rotation.z, deg_to_rad(-max_angle), deg_to_rad(max_angle))
		
		# Aplicar rotação suavizada
		rotation = rotation.lerp(target_rotation, delta * 1.0)
		angular_velocity = (rotation - last_rotation) / delta
		last_rotation = rotation
	else:
		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		var target_rotation = Vector3(
			deg_to_rad(input_dir.y * rotation_speed),
			0,
			deg_to_rad(-input_dir.x * rotation_speed)
		)
		rotation = rotation.lerp(target_rotation, delta * 5.0)
		angular_velocity = (rotation - last_rotation) / delta
		last_rotation = rotation
