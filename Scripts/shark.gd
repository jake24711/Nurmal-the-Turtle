extends Area2D

@export var player: Node


func _on_area_entered(area: Area2D) -> void:
	if area.name == "player":
		area.respawn()

func _process(delta: float) -> void:
	if player != null:
		var direction = (player.global_position - global_position).normalized()
		global_position += direction * delta * 100  # Adjust speed as needed
