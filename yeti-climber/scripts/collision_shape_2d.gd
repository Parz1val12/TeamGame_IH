extends Area2D

# Drag your RespawnPoint (Marker2D) into this slot in the Inspector
@export var respawn_point: Marker2D

func _on_body_entered(body: Node2D) -> void:
	# Check if the object that fell in is a player (CharacterBody2D)
	if body is CharacterBody2D:
		respawn_player(body)

func respawn_player(player: CharacterBody2D) -> void:
	# Reset their falling momentum so they don't keep falling fast after teleporting
	player.velocity = Vector2.ZERO
	
	# Teleport them back to the safe marker
	if respawn_point:
		player.global_position = respawn_point.global_position
