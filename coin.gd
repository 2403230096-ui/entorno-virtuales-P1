extends Area3D

@export var speed := 0.01
signal Monedas
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(speed)


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("Colision")
	if body is Player:
		print("Colision por Player")
		
	print("Colision por layer")
	emit_signal("coinCollected")
	queue_free()
