extends Node

@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var coins = get_tree().get_nodes_in_group("Coleccionables")
	for coin in coins :
		coin.coinCollected.connect(_on_coinCollected)
	
	pass # Replace with function body.

func _on_coinCollected():
	audio_stream_player_3d.play();
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
