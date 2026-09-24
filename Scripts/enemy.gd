extends Area2D

@export var can_wander: bool = false
@export var wander_speed: float = 30.0
@export var wander_radius: float = 60.0
@export var wander_interval: float = 2.0

var _start_position: Vector2
var _wander_target: Vector2
var _wander_timer: float = 0.0


func _ready() -> void:
	_start_position = global_position
	_pick_new_wander_target()


func _process(delta: float) -> void:
	if not can_wander:
		return

	_wander_timer -= delta
	if _wander_timer <= 0.0:
		_pick_new_wander_target()

	var direction := (_wander_target - global_position)
	if direction.length() > 1.0:
		global_position += direction.normalized() * wander_speed * delta


func _pick_new_wander_target() -> void:
	var offset := Vector2(randf_range(-wander_radius, wander_radius), randf_range(-wander_radius, wander_radius))
	_wander_target = _start_position + offset
	_wander_timer = wander_interval


func _on_area_entered(area: Area2D) -> void:
	if area.name == "player":
		area.respawn()

