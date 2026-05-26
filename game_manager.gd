extends Node
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

var coinCollector

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var coins = get_tree(). get_nodes_in_group("Monedas")
	for coin in coins :
		coin.Monedas.connect(_on_coinCollector)
		
func  _on_coinCollector():
	audio_stream_player_3d.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
