extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().connect("network_peer_connected", self, "_players_connected")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ButtonHost_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_server(6969, 8)
	get_tree().set_network_peer(net)
	print("hosting...")

func _on_ButtonJoin_pressed():
	var net = NetworkedMultiplayerENet.new()
	net.create_client("127.0.0.1", 6969)
	get_tree().set_network_peer(net)
	print("connecting to server...")

func _players_connected(id):
	Globals.player2id = id
	var game = preload("res://scenes/Game.tscn").instance()
	get_tree().get_root().add_child(game)
	hide()
	
