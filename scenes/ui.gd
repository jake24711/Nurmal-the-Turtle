extends CanvasLayer

var growth = 0
var deaths = 0

func _ready() -> void:
	Event_Bus.food_eaten.connect(add_growth)
	Event_Bus.deaths.connect(add_deaths)
	
func add_growth(added_growth):
	growth += added_growth
	update_ui()

func add_deaths(added_deaths):
	deaths += added_deaths
	update_ui()

func update_ui():
	$growth_label.text = "Growth: " + str(growth)
	$deaths_label.text = "Deaths: " + str(deaths)

func _process(_delta: float) -> void:
	if growth >= 7:
		get_tree().change_scene_to_file("res://scenes/end_scene.tscn")
	if deaths >= 5:
		get_tree().change_scene_to_file("res://scenes/lose_scene.tscn")
