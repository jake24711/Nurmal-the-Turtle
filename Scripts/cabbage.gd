extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area is eat_box:
		Event_Bus.food_eaten.emit(1)
		queue_free()
