extends Node
@onready var HelpP = $Control/HelpPanel
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")

func _on_button_2_pressed():
	HelpP.visible = true

func _on_close_help_pressed():
	HelpP.visible = false
