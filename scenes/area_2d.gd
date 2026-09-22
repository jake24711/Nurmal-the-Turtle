extends Area2D

class_name eat_box

var start_position = Vector2(1054.0,556.0)
var deaths = 0
var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("player_down") and position.y < 600:
		position.y += speed
	if Input.is_action_pressed("player_up") and position.y > 50:
		position.y -= speed
	if Input.is_action_pressed("player_right") and position.x < 1100:
		position.x += speed 
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_pressed("player_left") and position.x > 50: 
		position.x -= speed
		$AnimatedSprite2D.flip_h = true
	
	if deaths >= 5:
		get_tree().change_scene_to_file("res://scenes/lose_scene.tscn")

func respawn():
	position = start_position
	Event_Bus.deaths.emit(1)
