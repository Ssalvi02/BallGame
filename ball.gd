extends RigidBody3D

func _ready():
	mass = 1.0
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = 0.1
	physics_material_override.friction = 0.8
