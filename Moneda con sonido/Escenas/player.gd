class_name player
extends RigidBody3D

@onready var spring_arm_3d: SpringArm3D = $SpringArm3D

var speed = 0.5
# Reducimos la sensibilidad porque event.relative devuelve valores en píxeles
var mouse_sensitivity = 0.005	

# CORRECCIÓN: Se agregó el guion bajo '_' para que Godot reconozca la función nativa
func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		# Modificamos las rotaciones usando la sensibilidad corregida
		spring_arm_3d.rotation.x -= event.relative.y * mouse_sensitivity
		spring_arm_3d.rotation.y -= event.relative.x * mouse_sensitivity
		
		# Limpiamos los clamps repetidos y dejamos límites estándar en radianes (-60° a 45°)
		spring_arm_3d.rotation.x = clamp(spring_arm_3d.rotation.x, deg_to_rad(-60), deg_to_rad(45))

func _ready() -> void:
	spring_arm_3d.top_level = true
	# Captura el puntero del ratón para que no se salga de la pantalla al girar
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta: float) -> void:
	# Mantiene el SpringArm siguiendo la posición del cuerpo físico
	spring_arm_3d.global_position = self.global_position
	
func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	var inputDirection = Vector3(
		Input.get_axis("left", "right"),
		0,
		Input.get_axis("up", "down")
	)
	
	# Esto hace que el personaje se mueva en la dirección a la que apunta la cámara
	inputDirection = inputDirection.rotated(Vector3.UP, spring_arm_3d.rotation.y).normalized() * speed
	
	apply_central_impulse(Vector3(inputDirection.x, 0, inputDirection.z))
