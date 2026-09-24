extends Node2D


func _on_level_1_button_button_down():
	get_tree().change_scene_to_file("res://scenes/level1.tscn")


func _on_level_3_button_button_down():
	get_tree().change_scene_to_file("res://scenes/level3.tscn")


func _on_level_2_button_button_down():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")