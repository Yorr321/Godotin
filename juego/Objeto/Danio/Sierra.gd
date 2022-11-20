extends Area



func _on_body_entered(body: Node) -> void:
	var player: Godotin = body
	player.respawn()
