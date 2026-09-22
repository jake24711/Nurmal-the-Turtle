extends Camera2D 

@export var random_strength: float = 15.0
@export var shake_decay: float = 5.0

var shake_strength: float = 0.0

func _process(delta: float) -> void:
	if shake_strength > 0.0:
		# Gradually reduce shake intensity over time
		shake_strength = lerp(shake_strength, 0.0, shake_decay * delta)
		# Apply random offset within the current strength
		offset = get_random_offset()
	else:
		offset = Vector2.ZERO

func apply_shake(strength: float = -1.0) -> void:
	$Camera2D.apply_shake(30.0) 

# Or pass a custom strength for bigger impacts:

	
	

func get_random_offset() -> Vector2:
	return Vector2(
		randf_range(-shake_strength, shake_strength),
		randf_range(-shake_strength, shake_strength)
	)
